
import { createApp } from 'vue/dist/vue.esm-bundler';

import IndexPessoa from './components/pessoas/IndexPessoa.vue'
import FormPessoa from './components/pessoas/FormPessoa.vue'
import FormEndereco from './components/pessoas/FormEndereco.vue'

const app = createApp({});

app.component("index-pessoa-component", IndexPessoa)
app.component("form-pessoa-component", FormPessoa)
app.component("form-endereco-component", FormEndereco)

app.mount("#app");
