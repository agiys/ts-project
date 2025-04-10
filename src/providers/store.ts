import { createPinia } from 'pinia'
import { createApp } from 'vue'

const pinia = createPinia()

export const setupStore = (app: ReturnType<typeof createApp>) => {
  app.use(pinia)
}
