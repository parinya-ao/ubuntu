# create project 
bunx nuxi init <your project name>

# add tailwind to nuxt
# https://tailwindcss.nuxtjs.org/
bunx nuxi module add tailwindcss
echo "export default defineNuxtConfig({
  modules: ['@nuxtjs/tailwindcss'],
  tailwindcss: {
    exposeConfig: true,
    viewer: true,
  }
})" > nuxt.config.ts

# add eslint to nuxt
# https://eslint.nuxt.com/packages/module
bunx nuxi module add eslint
bun add -D typescript

echo "install all success"

