# Contributing to Ayzio Technology

## Hoş Geldiniz! / Welcome!

**Türkçe:**

Ayzio Technology topluluğuna katıldığınız için teşekkür ederiz! Bu proje, sevgi, saygı ve kardeşlik değerleri üzerine inşa edilmiştir. Katkıda bulunurken bu değerleri korumak önemlidir.

**English:**

Thank you for joining the Ayzio Technology community! This project is built on values of love, respect, and brotherhood. It's important to maintain these values when contributing.

---

## 🤝 Davranış Kuralları / Code of Conduct

### Türkçe:
1. **Saygılı olun:** Her katkıda bulunanın görüşüne saygı gösterin
2. **Yardımsever olun:** Yeni gelenlere yardım edin
3. **Yapıcı olun:** Eleştirilerinizi yapıcı bir şekilde sunun
4. **İşbirlikçi olun:** Birlikte daha güçlüyüz
5. **Dürüst olun:** Şeffaflık ve dürüstlük temel değerlerimizdir

### English:
1. **Be respectful:** Respect everyone's opinions
2. **Be helpful:** Help newcomers
3. **Be constructive:** Present criticism constructively
4. **Be collaborative:** We are stronger together
5. **Be honest:** Transparency and honesty are our core values

---

## 🔧 Nasıl Katkıda Bulunulur / How to Contribute

### 1. Repository'yi Fork Edin / Fork the Repository

```bash
# Repo'yu fork edin ve klonlayın / Fork and clone the repo
git clone https://github.com/YOUR-USERNAME/Ayzio-Technology.git
cd Ayzio-Technology
```

### 2. Yeni Bir Branch Oluşturun / Create a New Branch

```bash
# Açıklayıcı bir isimle branch oluşturun / Create branch with descriptive name
git checkout -b feature/amazing-feature
# veya / or
git checkout -b fix/bug-description
```

### 3. Değişikliklerinizi Yapın / Make Your Changes

- Kod kalitesini koruyun / Maintain code quality
- Açıklayıcı commit mesajları yazın / Write descriptive commit messages
- Gerekirse testler ekleyin / Add tests if needed

### 4. Commit Edin / Commit Your Changes

```bash
git commit -m "feat: Add amazing feature"
# veya / or
git commit -m "fix: Resolve specific bug"
```

**Commit Mesaj Formatı / Commit Message Format:**
- `feat:` Yeni özellik / New feature
- `fix:` Hata düzeltme / Bug fix
- `docs:` Dokümantasyon / Documentation
- `style:` Kod formatı / Code formatting
- `refactor:` Kod yeniden yapılandırma / Code refactoring
- `test:` Test ekleme / Adding tests
- `chore:` Diğer değişiklikler / Other changes

### 5. Pull Request Oluşturun / Create a Pull Request

- Değişikliklerinizi açıklayın / Describe your changes
- İlgili issue'ları referans gösterin / Reference related issues
- Screenshots ekleyin (UI değişiklikleri için) / Add screenshots (for UI changes)

---

## 🎯 Katkı Alanları / Contribution Areas

### Kod / Code
- Smart contract geliştirme / Smart contract development
- Frontend geliştirme / Frontend development
- Backend geliştirme / Backend development
- Test yazma / Writing tests
- Hata düzeltme / Bug fixing

### Dokümantasyon / Documentation
- README güncellemeleri / README updates
- API dokümantasyonu / API documentation
- Eğitim materyalleri / Tutorial materials
- Çeviri / Translation (Turkish ↔ English)

### Tasarım / Design
- UI/UX iyileştirmeleri / UI/UX improvements
- Logo ve grafik tasarım / Logo and graphic design
- Kullanıcı deneyimi / User experience

### Topluluk / Community
- Issue'lara yanıt verme / Responding to issues
- Yeni kullanıcılara yardım / Helping new users
- Topluluk etkinlikleri / Community events
- Sosyal medya / Social media

---

## 📝 Kod Standartları / Code Standards

### JavaScript/TypeScript
```javascript
// Açık ve anlaşılır değişken isimleri kullanın
// Use clear and understandable variable names
const userTokenBalance = await getUserBalance(address);

// Fonksiyonları dokümante edin / Document functions
/**
 * Calculates user's token rewards
 * @param {string} userAddress - User's wallet address
 * @param {number} stakingDuration - Duration in days
 * @returns {Promise<number>} - Reward amount
 */
async function calculateRewards(userAddress, stakingDuration) {
  // Implementation
}
```

### Solidity (Smart Contracts)
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AyzioToken
 * @dev Community-driven token with fair distribution
 */
contract AyzioToken {
    // Clear comments and documentation
    // Security best practices
    // Gas optimization
}
```

---

## 🧪 Test Etme / Testing

```bash
# Testleri çalıştırın / Run tests
npm test

# Linter çalıştırın / Run linter
npm run lint

# Build kontrol edin / Check build
npm run build
```

---

## 🔒 Güvenlik / Security

Güvenlik açığı bulursanız:
If you find a security vulnerability:

1. **HERKESE AÇIK BİR ISSUE AÇMAYIN / DO NOT OPEN A PUBLIC ISSUE**
2. security@ayzio.tech adresine e-posta gönderin (Coming Soon)
3. Veya repository sahibine özel mesaj gönderin / Or send a private message to repository owner

---

## 📞 İletişim / Contact

- **GitHub Issues:** Teknik konular için / For technical matters
- **Discussions:** Genel tartışmalar için / For general discussions
- **Email:** Coming Soon

---

## 🙏 Teşekkürler / Thank You

Her katkınız, topluluğumuzu güçlendiriyor ve platformumuzu daha iyi hale getiriyor. Katkılarınız için teşekkür ederiz!

Every contribution strengthens our community and makes our platform better. Thank you for your contributions!

**Sevgi ve saygıyla / With love and respect,**
**Ayzio Technology Topluluğu / Ayzio Technology Community**
