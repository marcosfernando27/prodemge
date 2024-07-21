<template>

<!-- <input type="text" v-model="formDataAddress.pessoa_id"> -->

<div class="flex flex-wrap gap-x-5 gap-y-4 p-4">
    <div class="w-full lg:w-72">
        <label for="tipo_endereco">Selecione o tipo de endereço: *</label>

        <select
            id="tipo_endereco"
            v-model="formDataAddress.tipo_endereco_id"
            class="form-control"
            required>

            <option
                v-for="tipo in tiposEnderecos"
                :key="tipo.id_tipo_endereco"
                :value="tipo.id_tipo_endereco">
                {{ tipo.tipo }}
            </option>
        </select>

    </div>
</div>

<div class="flex flex-wrap gap-x-5 gap-y-4 p-4">
    <div class="w-full lg:w-72">

        <label for="">CEP * <small>(pressione tab após digitar o cep)</small></label>
        <input
            type="text"
            id="cep"
            maxlength="9"
            class="form-control"
            @keyup="consultaCep(formDataAddress.cep)"
            v-model="formDataAddress.cep"
        />

    </div>

    <div class="w-full lg:w-96">
       <InputText
            label="Logradouro"
            type="text"
            id="logradouro"
            maxlength="128"
            v-model="formDataAddress.logradouro"
            aria-label="Logradouro"
            :disabled=disabled.logradouro
            >
        </InputText>
    </div>

    <div class="w-full lg:w-32">
       <InputText
            label="Número"
            type="text"
            id="numero"
            maxlength="16"
            v-model="formDataAddress.numero"
            aria-label="Número"
            :disabled=disabled.numero
            >
        </InputText>
    </div>

     <div class="w-full lg:w-56">
       <InputText
            label="Complemento"
            type="text"
            id="complemento"
            maxlength="24"
            v-model="formDataAddress.complemento"
            aria-label="Complemento"
            :disabled=disabled.complemento
            >
        </InputText>
    </div>
</div>

<div class="flex flex-wrap gap-x-5 gap-y-4 p-4">
    <div class="w-full lg:w-96">
       <InputText
            label="Bairro"
            type="text"
            id="bairro"
            maxlength="64"
            v-model="formDataAddress.bairro"
            aria-label="Bairro"
            :disabled=disabled.bairro
            >
        </InputText>
    </div>

    <div class="w-full lg:w-96">
       <InputText
            label="Estado"
            type="text"
            id="estado"
            maxlength="24"
            v-model="formDataAddress.estado"
            aria-label="Estado"
            :disabled=disabled.estado
            >
        </InputText>
    </div>
    <div class="w-full lg:w-96">
       <InputText
            label="Cidade"
            type="text"
            id="cidade"
            maxlength="64"
            class="form-control"
            v-model="formDataAddress.cidade"
            aria-label="Cidade"
            :disabled=disabled.cidade
            >
        </InputText>
    </div>
</div>


</template>

<script>
import { IMaskDirective } from 'vue-imask'
import axios from 'axios'

import InputText from '../InputText.vue'

export default {

    props: ['formDataAddress', 'tiposEnderecos'],

    components:{
        InputText
    },

    data(){
        return {
            urlBase: '/api/',
            cep: '',
            disabled: {
                cidade: true,
                logradouro: true,
                numero: false,
                complemento: true,
                bairro: true,
                estado: true,
                cidade: true
            },
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

    methods: {
        consultaCep(cep){

            this.isLoading = true

            axios.get(this.urlBase + 'api_cep/' + cep)
            .then(response => {
                this.isLoading = false

                // console.log(response.data);

                if(response.status == 200) {

                    if(response.data.localidade != '') {
                        this.formDataAddress.cidade = response.data.localidade
                        this.disabled.cidade = true
                    }else{
                        this.disabled.cidade = false
                    }

                    if(response.data.logradouro != '') {
                        this.formDataAddress.logradouro = response.data.logradouro
                        this.disabled.logradouro = true
                    }else{
                        this.disabled.logradouro = false
                    }

                    if(response.data.complemento != '') {
                        this.formDataAddress.complemento = response.data.complemento
                        this.disabled.complemento = true
                    }else{
                        this.disabled.complemento = false
                    }

                    if(response.data.bairro != '') {
                        this.formDataAddress.bairro = response.data.bairro
                        this.disabled.bairro = true
                    } else{
                        this.disabled.bairro = false
                    }

                    if(response.data.uf != '') {
                        this.formDataAddress.estado = response.data.uf
                        this.disabled.estado = true
                    } else{
                        this.disabled.estado = false
                    }
                }

            })
            .catch(error => {
                this.isLoading = false
                console.error(error);
            })
        }
    },

    directives: {
        imask: IMaskDirective,
    },
}
</script>
