// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

/**
 * @title AyzioToken
 * @dev Community-driven token for Ayzio Technology platform
 * 
 * Core Principles:
 * - Love and Respect (Sevgi ve Saygı)
 * - Community Growth without spending money
 * - Fair distribution
 * - Sustainable tokenomics
 */
contract AyzioToken is ERC20, Ownable, Pausable {
    
    // Token distribution percentages
    uint256 public constant TOTAL_SUPPLY = 1_000_000_000 * 10**18; // 1 billion tokens
    uint256 public constant COMMUNITY_ALLOCATION = 400_000_000 * 10**18; // 40% for community
    uint256 public constant STAKING_REWARDS = 300_000_000 * 10**18; // 30% for staking rewards
    uint256 public constant DEVELOPMENT_FUND = 200_000_000 * 10**18; // 20% for development
    uint256 public constant TEAM_ALLOCATION = 100_000_000 * 10**18; // 10% for team (vested)
    
    // Staking mechanism
    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public stakingStartTime;
    mapping(address => uint256) public accumulatedRewards;
    
    // Community engagement rewards
    mapping(address => uint256) public contributionScore;
    mapping(address => uint256) public lastContributionTime;
    
    // Constants for reward calculation
    uint256 public constant DAILY_REWARD_RATE = 1; // 1% daily for staking
    uint256 public constant CONTRIBUTION_REWARD = 10 * 10**18; // 10 tokens per contribution
    
    // Events
    event TokensStaked(address indexed user, uint256 amount);
    event TokensUnstaked(address indexed user, uint256 amount);
    event RewardsClaimed(address indexed user, uint256 amount);
    event ContributionRecorded(address indexed user, uint256 score);
    
    constructor() ERC20("Ayzio Token", "AYZIO") {
        // Mint total supply to contract for controlled distribution
        _mint(address(this), TOTAL_SUPPLY);
    }
    
    /**
     * @dev Stake tokens to earn rewards
     * Community members can stake without fees
     */
    function stake(uint256 amount) external whenNotPaused {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        // Claim any pending rewards before staking more
        if (stakedBalance[msg.sender] > 0) {
            _claimRewards();
        }
        
        // Transfer tokens to contract
        _transfer(msg.sender, address(this), amount);
        
        // Update staking records
        stakedBalance[msg.sender] += amount;
        stakingStartTime[msg.sender] = block.timestamp;
        
        emit TokensStaked(msg.sender, amount);
    }
    
    /**
     * @dev Unstake tokens and claim rewards
     */
    function unstake(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(stakedBalance[msg.sender] >= amount, "Insufficient staked balance");
        
        // Claim rewards first
        _claimRewards();
        
        // Update staked balance
        stakedBalance[msg.sender] -= amount;
        
        // Transfer tokens back to user
        _transfer(address(this), msg.sender, amount);
        
        emit TokensUnstaked(msg.sender, amount);
    }
    
    /**
     * @dev Calculate pending rewards for a user
     */
    function pendingRewards(address user) public view returns (uint256) {
        if (stakedBalance[user] == 0) {
            return 0;
        }
        
        uint256 stakingDuration = block.timestamp - stakingStartTime[user];
        uint256 dailyReward = (stakedBalance[user] * DAILY_REWARD_RATE) / 100;
        uint256 daysStaked = stakingDuration / 1 days;
        
        return (dailyReward * daysStaked) + accumulatedRewards[user];
    }
    
    /**
     * @dev Claim staking rewards
     */
    function claimRewards() external {
        _claimRewards();
    }
    
    /**
     * @dev Internal function to claim rewards
     */
    function _claimRewards() internal {
        uint256 rewards = pendingRewards(msg.sender);
        
        if (rewards > 0) {
            accumulatedRewards[msg.sender] = 0;
            stakingStartTime[msg.sender] = block.timestamp;
            
            // Transfer rewards from contract
            _transfer(address(this), msg.sender, rewards);
            
            emit RewardsClaimed(msg.sender, rewards);
        }
    }
    
    /**
     * @dev Record community contribution
     * Can be called by platform to reward active members
     */
    function recordContribution(address user, uint256 score) external onlyOwner {
        require(user != address(0), "Invalid address");
        require(score > 0, "Score must be positive");
        
        contributionScore[user] += score;
        lastContributionTime[user] = block.timestamp;
        
        // Give contribution reward
        _transfer(address(this), user, CONTRIBUTION_REWARD);
        
        emit ContributionRecorded(user, score);
    }
    
    /**
     * @dev Distribute community tokens
     * Only owner can call this for fair distribution
     */
    function distributeCommunityTokens(address[] memory recipients, uint256[] memory amounts) 
        external 
        onlyOwner 
    {
        require(recipients.length == amounts.length, "Arrays length mismatch");
        
        for (uint256 i = 0; i < recipients.length; i++) {
            require(recipients[i] != address(0), "Invalid recipient");
            _transfer(address(this), recipients[i], amounts[i]);
        }
    }
    
    /**
     * @dev Emergency pause
     */
    function pause() external onlyOwner {
        _pause();
    }
    
    /**
     * @dev Unpause
     */
    function unpause() external onlyOwner {
        _unpause();
    }
    
    /**
     * @dev Get user's total value (staked + wallet balance)
     */
    function getTotalValue(address user) external view returns (uint256) {
        return balanceOf(user) + stakedBalance[user] + pendingRewards(user);
    }
}
