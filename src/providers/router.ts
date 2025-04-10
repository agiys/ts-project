import { createRouter, createWebHistory } from 'vue-router'
import FormPage from '@/pages/FormPage/index.vue'
import ResultPage from '@/pages/ResultPage/index.vue'
import { createApp } from 'vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: FormPage },
    { path: '/result', component: ResultPage },
  ],
})

export const setupRouter = (app: ReturnType<typeof createApp>) => {
  app.use(router)
}
