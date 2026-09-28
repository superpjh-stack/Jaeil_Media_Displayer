# 정적 파일을 nginx로 서빙하는 포트폴리오 월 이미지
FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html config.js /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
