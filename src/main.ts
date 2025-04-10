import { createApp } from 'vue'
import App from './App.vue'
import { setupRouter } from './providers/router'
import { setupStore } from './providers/store'

const app = createApp(App)

setupStore(app)
setupRouter(app)

app.mount('#app')
