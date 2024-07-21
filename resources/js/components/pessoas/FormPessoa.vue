<template>
<div class="flex flex-wrap gap-x-5 gap-y-4 p-4">
    <div class="w-full lg:w-96">
       <InputText
            label="Nome"
            type="text"
            id="nome"
            maxlength="255"
            v-model="formData.nome"
            aria-label="Nome"
            >
        </InputText>
    </div>

    <div class="w-full lg:w-96">
       <InputText
            label="Nome Social"
            type="text"
            id="nome_social"
            maxlength="128"
            v-model="formData.nome_social"
            aria-label="Nome Social"
            >
        </InputText>
    </div>

     <div class="w-full lg:w-52">
        <label for="cpf">CPF *</label>
        <input
            type="text"
            v-model="formData.cpf"
            v-imask="mask_cpf"
            maxlength="14"
            id="cpf"
            class="form-control"
            required
        >
    </div>
</div>

<div class="flex flex-wrap gap-x-5 gap-y-4 p-4">
    <div class="w-full lg:w-96">
       <InputText
            label="Nome do Pai"
            type="text"
            id="nome_pai"
            maxlength="255"
            v-model="formData.nome_pai"
            aria-label="Nome do pai"
            >
        </InputText>
    </div>

    <div class="w-full lg:w-96">
       <InputText
            label="Nome da Mãe"
            type="text"
            id="nome_mae"
            maxlength="128"
            v-model="formData.nome_mae"
            aria-label="Nome Social"
            >
        </InputText>
    </div>
</div>

<div class="flex flex-wrap gap-x-5 gap-y-4 p-4">
    <div class="w-full lg:w-52">
        <label for="cpf">Telefone *</label>
        <input
            type="text"
            v-model="formData.telefone"
            v-imask="mask_telefone"
            maxlength="14"
            id="telefone"
            class="form-control"
            required
        >
    </div>

    <div class="w-full lg:w-96">
       <InputText
            label="E-mail"
            type="email"
            id="email"
            maxlength="128"
            v-model="formData.email"
            aria-label="E-mail"
            >
        </InputText>
    </div>
</div>
</template>

<script>
import { IMaskDirective } from 'vue-imask'

import InputText from '../InputText.vue'

export default {

    props: ['formData'],

    components:{
        InputText
    },

    data(){
        return {
            mask_cpf: {
                mask: '000.000.000-00',
                lazy: true
            },
            mask_telefone: {
                mask: '(00)00000-0000',
                lazy: true
            },
        }
    },

    directives: {
        imask: IMaskDirective,
    },
}
</script>
