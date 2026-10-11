# 블러드본 PC (한국어 배포판)

PS4판 *Bloodborne*을 Windows 10/11에서 네이티브로 실행하는 포팅
[Supermedo/bloodborne_pc](https://github.com/Supermedo/bloodborne_pc) **Windows 1.6**에,
한국 사용자에게 필요한 수정을 더한 비공식 배포판입니다.

**[다운로드 (Releases)](../../releases/latest)** · [English README](README.en.md)

> **게임 파일은 들어 있지 않습니다.** 직접 덤프한 Bloodborne(CUSA03173 등) 폴더가 필요하며,
> 커뮤니티 패치(60/90 FPS, 해상도, 효과)를 쓰려면 게임 버전 1.09여야 합니다.
> Sony Interactive Entertainment, FromSoftware, 원 포팅 제작자들과 관계없는 개인 배포판입니다.

## 공식 1.6과 다른 점

| 변경 | 내용 |
|---|---|
| **VRAM 누수 수정** | 공식 1.6은 텍스처 정리 기능이 한 번 막히면 다시 돌지 않아, 지역을 옮길 때마다 VRAM이 계속 쌓입니다(16GB 카드 기준 약 11GB까지). 원작 리눅스판 0.3의 수정을 옮겨, 20초 동안 쓰지 않은 텍스처를 다시 정리합니다. ([Supermedo#32](https://github.com/Supermedo/bloodborne_pc/pull/32)) |
| **일본/아시아 버튼 배치 (기본 켜짐)** | **동그라미 = 결정·상호작용, 엑스 = 취소·회피**, 화면 버튼 아이콘도 함께 바뀝니다. 게임 자체의 지역별 배치 판정을 바꾸는 패치입니다. 런처 **Cheats** 페이지(또는 인게임 메뉴)에서 끄면 서양판 배치로 돌아갑니다. ([Supermedo#17](https://github.com/Supermedo/bloodborne_pc/pull/17)) |
| **한글 패치 설치 스크립트** | `Install-Korean-Patch.bat`를 실행하면 kairess님의 한글 패치를 원저작자 GitHub 릴리스에서 받아 `mods` 폴더에 설치합니다(아래 참고). |
| **문제 해결 문서** | AMD RX 6000(RDNA2)에서 겪은 튕김·성능·온라인 문제와 해결 설정: [docs/WINDOWS_TROUBLESHOOTING.md](docs/WINDOWS_TROUBLESHOOTING.md) |
| 빌드 | 최신 MSYS2(clang 23)에서도 빌드되도록 `build.sh`에 컴파일 옵션 추가. 동작 변경 없음. |

## 설치와 실행

1. [Releases](../../releases/latest)에서 zip을 받아 원하는 곳에 풉니다.
2. **`Install-Korean-Patch.bat`** 실행 → 한글 패치가 `mods` 폴더에 설치됩니다(인터넷 필요).
3. **`Bloodborne.exe`** 실행 → **Game & effects** 페이지에서 게임 폴더(`eboot.bin`이 있는 폴더)를 고릅니다.
   - **게임 언어는 English** 그대로 두세요. 한글 패치가 영어 텍스트를 한글로 바꾸는 방식입니다.
4. **PLAY**. 다음부터는 `Play Bloodborne.exe`로 런처 없이 바로 시작할 수 있습니다.

게임 중 **Insert**(패드는 **L3+R3**)로 포트 메뉴(업스케일러, 해상도, 효과)를 엽니다.

## 한글 패치

- 제작: **kairess** — [kairess/bb-enhanced-vanillaplus-korean](https://github.com/kairess/bb-enhanced-vanillaplus-korean)
  (소개글: [디시인사이드 블러드본 마이너 갤러리](https://gall.dcinside.com/mini/board/view/?id=borne&no=576))
- 공식 한글 번역 + BB Enhanced / Vanilla Plus 모드 텍스트 번역 + 한글 폰트. 모드 없이 써도 원래 게임 텍스트는 공식 한글로 나옵니다.
- 원저작자 저장소에 라이선스가 명시되어 있지 않아 이 배포판에 파일을 넣지 않고, 설치 스크립트가 원저작자 릴리스에서 직접 받습니다.
- BB Enhanced / Vanilla Plus 모드를 함께 쓸 때는 한글 패치를 모드 목록 **맨 아래**에 두세요.

## AMD 그래픽카드에서 튕길 때

RX 6900 XT에서 아래 설정으로 안정적으로 돌아갔습니다. 자세한 로그 해석은 [문제 해결 문서](docs/WINDOWS_TROUBLESHOOTING.md)를 보세요.

- **Advanced → Two-stage GPU pipeline: Off**
- **Advanced → Extra variables:** `BB_COPY_GPU_BUFFERS=1 BB_PREP_WORKERS=0`
- **Graphics → Object motion vectors:** 끄기
- RX 6000 이하에서 4K는 **FSR 3.1** 권장(FSR 4는 매우 느림)
- 튕긴 뒤 시작하자마자 꺼지면 **Advanced → Clear shader cache**

런처가 열려 있는 동안 설정 파일을 직접 고치면 런처가 덮어씁니다. 설정은 런처 화면에서 바꾸세요.

## 업데이트에 대해

런처의 **Update**는 공식 Supermedo 릴리스를 확인합니다. 공식 새 버전으로 업데이트하면 이 배포판의
변경(VRAM 수정, 버튼 배치)이 사라질 수 있습니다. 세이브·설정·mods 폴더는 유지됩니다.

## 크레딧과 라이선스

- 원작 리눅스 포트 bbport: [deadinside28/bloodborne_pc](https://github.com/deadinside28/bloodborne_pc)
- Windows 포트: [Supermedo/bloodborne_pc](https://github.com/Supermedo/bloodborne_pc) (Mohammed Albarghouthi)
- 한글 패치: [kairess/bb-enhanced-vanillaplus-korean](https://github.com/kairess/bb-enhanced-vanillaplus-korean)
- 그 밖의 프로젝트와 패치 제작자 목록은 [README.en.md](README.en.md)의 Credits를 보세요.

GNU GPL v2 이상([LICENSE](LICENSE)). 이 저장소가 배포판의 전체 소스입니다. 서드파티 구성요소는
각자의 라이선스를 따릅니다(배포 zip의 `licenses\`).
