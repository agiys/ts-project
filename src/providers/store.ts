import { createPinia } from 'pinia'

const pinia = createPinia()

export const setupStore = (app: ReturnType<typeof createApp>) => {
  app.use(pinia)
}
