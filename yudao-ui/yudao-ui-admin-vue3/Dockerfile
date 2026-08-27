# ===== 构建阶段：Node 22 + pnpm 10 构建 Vue3 前端 =====
FROM node:22-slim AS build
WORKDIR /app

# corepack 固定 pnpm 10（pnpm-workspace.yaml 的 allowBuilds 是 pnpm 10 专属语法）
RUN corepack enable && corepack prepare pnpm@10 --activate

# 先只拷依赖清单，最大化 Docker 层缓存（pnpm-lock 已指向 npmmirror 国内源）
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
# 注意：该前端是定制恢复版，lockfile 与 package.json 有出入，不能用 --frozen-lockfile
RUN pnpm install --no-frozen-lockfile

# 拷贝前端源码
COPY . .

# 覆盖生产变量：VITE_BASE_URL 置空（→ 同域相对路径 /admin-api，nginx 反代，局域网才通）
# 关闭验证码，便于登录验证
# 注意：Vite 的 import.meta.env 只从 .env 文件读取，.env.prod.local 优先级最高
ARG VITE_BASE_URL=
ARG VITE_APP_CAPTCHA_ENABLE=false
RUN printf 'VITE_BASE_URL=%s\nVITE_APP_CAPTCHA_ENABLE=%s\n' "$VITE_BASE_URL" "$VITE_APP_CAPTCHA_ENABLE" > .env.prod.local

# 生产构建（--mode prod → 读 .env.prod + .env.prod.local，产出 dist-prod）
RUN pnpm build:prod

# ===== 运行阶段：nginx 托管静态产物 =====
FROM nginx:1.27-alpine AS run
COPY --from=build /app/dist-prod /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
