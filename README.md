# Jaeil_Media_Displayer

전시 부스용 포트폴리오 월 — 4K 모니터 1대를 분할 그리드로 나눠 작품 5개를 무인 루프로 보여줍니다.

- 히어로 1칸 + 작은 칸 4개 + 정보 패널(시계·QR), 18초마다 다음 작품이 히어로로 전환
- 사이트 화면을 미리 캡처해 재생하므로 **오프라인에서도 동작** (외부 CDN·폰트 없음)
- QR 코드로 방문자가 라이브 데모에 바로 접속

## 실행

| 방법 | 명령 |
|---|---|
| 키오스크(전체화면) | `start.command` 더블클릭 — 종료는 `Cmd+Q` |
| 개발 서버 | `python3 -m http.server 5173` → http://127.0.0.1:5173/ |

- `←` / `→` 수동 전환, `F` 전체화면
- `?start=3` 으로 특정 작품부터 시작

## 서버 배포 (Docker)

`docker-compose.yml`은 서버에서 빌드하지 않습니다. 시작할 때 GitHub 저장소 최신 main을 내려받아 nginx로 서빙합니다(호스트 포트 8700).

- 내용 변경 → GitHub에 push → Docker Manager에서 프로젝트 재배포
- 로컬에서 이미지로 직접 빌드하려면 `docker build -t jaeil-media-displayer . && docker run -p 8700:80 jaeil-media-displayer`
배포 주소: http://187.52.127.215:8700/

## 내용 수정

`config.js` 만 고치면 됩니다.

- `title`, `category`, `summary`, `tags`, `metrics`(첫 번째 값이 작은 칸에도 표시)
- `accent`: 밝은 강조색(라인·배경), `ink`: 흰 배경 위 글자용 진한 색
- `video`: `assets/videos/`에 화면 녹화 MP4를 넣고 경로를 적으면 캡처 이미지 대신 영상 재생

## 캡처 갱신

```sh
./capture.sh
```

전시 전날 1회 실행 권장. QR 코드(`assets/qr/*.svg`)는 URL이 바뀔 때만 다시 만들면 됩니다.
