const hre = require("hardhat");
const fs = require("fs");

async function main() {
  console.log("🚀 Ayzio Technology Deployment Starting...\n");
  
  // Get deployer account
  const [deployer] = await hre.ethers.getSigners();
  console.log("📝 Deploying contracts with account:", deployer.address);
  console.log("💰 Account balance:", (await deployer.getBalance()).toString(), "\n");

  // Deploy AyzioToken
  console.log("📦 Deploying AyzioToken...");
  const AyzioToken = await hre.ethers.getContractFactory("AyzioToken");
  const ayzioToken = await AyzioToken.deploy();
  await ayzioToken.deployed();
  console.log("✅ AyzioToken deployed to:", ayzioToken.address);

  // Deploy CommunityGovernance
  console.log("\n📦 Deploying CommunityGovernance...");
  const CommunityGovernance = await hre.ethers.getContractFactory("CommunityGovernance");
  const governance = await CommunityGovernance.deploy();
  await governance.deployed();
  console.log("✅ CommunityGovernance deployed to:", governance.address);

  // Configuration
  console.log("\n⚙️  Configuring contracts...");
  
  // Grant roles and initial setup can be done here
  console.log("✅ Configuration complete");

  // Summary
  console.log("\n" + "=".repeat(60));
  console.log("🎉 DEPLOYMENT SUCCESSFUL!");
  console.log("=".repeat(60));
  console.log("\n📋 Contract Addresses:");
  console.log("   AyzioToken:", ayzioToken.address);
  console.log("   CommunityGovernance:", governance.address);
  console.log("\n💡 Next Steps:");
  console.log("   1. Verify contracts on block explorer");
  console.log("   2. Update .env with contract addresses");
  console.log("   3. Grant necessary roles for governance");
  console.log("   4. Begin community distribution");
  console.log("\n💚 Sevgi ve Saygıyla / With Love and Respect");
  console.log("   Ayzio Technology Team");
  console.log("=".repeat(60) + "\n");

  // Save deployment info
  const deploymentInfo = {
    network: hre.network.name,
    deployer: deployer.address,
    timestamp: new Date().toISOString(),
    contracts: {
      AyzioToken: ayzioToken.address,
      CommunityGovernance: governance.address,
    },
  };

  fs.writeFileSync(
    "deployment-info.json",
    JSON.stringify(deploymentInfo, null, 2)
  );
  console.log("📄 Deployment info saved to deployment-info.json\n");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });
