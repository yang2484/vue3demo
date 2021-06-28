import { createApp } from 'vue'
import App from './App.vue'
import './index.css'
import Markdown from 'vue3-markdown-it';
import 'highlight.js/styles/monokai-sublime.css';
Markdown.name = 'Markdown'
console.log(Markdown)

const app = createApp(App)

app.use(Markdown);

app.mount('#app')
