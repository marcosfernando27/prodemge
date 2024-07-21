<template>
    <h1>
        <UsersIcon class="icon_h1" /> Gestão de Pessoas
    </h1>

    <!-- Adicionar Pessoa Btn -->
    <Button
        className="btn-primary flex items-center"
        title="Cadastrar Pessoa"
        v-on:click="modalCreate()"
        icon="create">
    </Button>

    <!-- Listar pessoas -->
    <table class="table-auto">
        <thead>
            <tr>
                <th class="px-4 py-2">ID</th>
                <th class="px-4 py-2">Nome</th>
                <th class="px-4 py-2">Nome social</th>
                <th class="px-4 py-2">CPF</th>
                <th class="px-4 py-2">E-mail</th>
                <th class="px-4 py-2">Telefone</th>
                <th class="px-4 py-2">Endereço</th>
                <th class="px-4 py-2">Histórico</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="pessoa in pessoas" :key="pessoa.id_pessoa">

                <td class="border px-4 py-2">
                    {{ pessoa.id_pessoa }}
                </td>
                <td class="border px-4 py-2">
                    {{ pessoa.nome }}
                </td>
                <td class="border px-4 py-2">
                    {{ pessoa.nome_social }}
                </td>
                <td class="border px-4 py-2">
                    {{ pessoa.cpf }}
                </td>
                <td class="border px-4 py-2">
                    {{ pessoa.email }}
                </td>
                <td class="border px-4 py-2">
                    {{ pessoa.telefone }}
                </td>
                <td class="border px-4 py-2">
                    <Button
                        className="btn-primary-outline"
                        title="Endereço"
                        v-on:click="modalAddress(pessoa.id_pessoa)"
                        icon="address">
                    </Button>

                </td>
                <td class="border px-4 py-2">
                    <Button
                        className="btn-primary-outline"
                        title="Histórico"
                        v-on:click="modalHistoric(pessoa.id_pessoa)"
                        icon="time">
                    </Button>
                </td>
            </tr>
        </tbody>
    </table>


    <!-- Adicionar Pessoa -->
    <form @submit.prevent="storePessoa(id_pessoa)">

        <Modal
            :exibir="modal_create"
            icon="create"
            title="Cadastrar Pessoa"
            size="w-[80%]"
        >

            <form-pessoa-component
                :formData="formData">
            </form-pessoa-component>

            <div class="p-2 mt-4 text-center space-x-4 md:block">
            <button
                    type="button"
                    class="btn-default"
                    v-on:click="closeModal"
                    >
                    Cancelar
                </button>
                <button
                    type="submit"
                    class="btn-primary">Cadastrar
                </button>
            </div>
        </Modal>
    </form>


    <!-- Adicionar Endereço -->
    <form @submit.prevent="storeEndereco()">

        <Modal
            :exibir="modal_address"
            icon="create"
            title="Endereço"
            size="w-[80%]"
        >

            <form-endereco-component
                :formDataAddress="formDataAddress"
                :tiposEnderecos="tipos_enderecos">
            </form-endereco-component>

            <div class="p-2 mt-4 text-center space-x-4 md:block">
            <button
                    type="button"
                    class="btn-default"
                    v-on:click="closeModal"
                    >
                    Cancelar
                </button>
                <button
                    type="submit"
                    class="btn-primary">Cadastrar
                </button>
            </div>
        </Modal>
    </form>


    <!-- Histórico -->
    <Modal
        :exibir="modal_historic"
        icon="create"
        title="Histórico"
        size="w-[90%]"
    >
        <!-- Listar endereços histórico -->
        <table class="table-auto">
        <thead>
            <tr>
                <th class="px-4 py-2">Tipo de Endereço</th>
                <th class="px-4 py-2">CEP</th>
                <th class="px-4 py-2">Logradouro</th>
                <th class="px-4 py-2">Número</th>
                <th class="px-4 py-2">Complemento</th>
                <th class="px-4 py-2">Bairro</th>
                <th class="px-4 py-2">Estado</th>
                <th class="px-4 py-2">Cidade</th>
                <th class="px-4 py-2">Status</th>
                <th class="px-4 py-2">Data</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="e in historico_enderecos" :key="e.id_endereco" :class="e.historico == false ? 'bg-green-100' : 'bg-white'">
                <td class="border px-4 py-2">
                    {{ e.tipo_endereco.tipo }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.cep }}
                </td>
                 <td class="border px-4 py-2">
                    {{ e.logradouro }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.numero }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.complemento }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.bairro }}
                </td>
                 <td class="border px-4 py-2">
                    {{ e.estado }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.cidade }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.historico == false ? 'Atual' : 'Histórico' }}
                </td>
                <td class="border px-4 py-2">
                    {{ e.created_at }}
                </td>
            </tr>
        </tbody>
    </table>

        <div class="p-2 mt-4 text-center space-x-4 md:block">
        <button
                type="button"
                class="btn-default"
                v-on:click="closeModal"
                >
                Fechar
            </button>
        </div>
    </Modal>

    <!-- Loading -->
    <loading :is-loading="isLoading" />

</template>

<script>
import axios from 'axios'
import { UsersIcon } from "@heroicons/vue/24/outline";
import Button from "../Button.vue";
import Modal from "../Modal.vue";
import Loading from "../Loading.vue";

export default {
    components: {
        UsersIcon,
        Button,
        Modal,
        Loading
    },

    data() {
        return {
            urlBase: '/api/',
            pessoas: [],
            tipos_enderecos: [],
            historico_enderecos: [],
            id_pessoa: null,
            modal_create: false,
            modal_address: false,
            modal_historic: false,
            formData: {
                nome: '',
                nome_social: '',
                cpf: '',
                email: '',
                telefone: '',
                nome_pai: '',
                nome_mae: '',
                email: ''
            },
            formDataAddress: {
                cep: '',
                logradouro: '',
                numero: '',
                complemento: '',
                bairro: '',
                estado: '',
                cidade: '',
                historico: '',
                tipo_endereco_id: '',
                pessoa_id: ''
            },
            msg: '',
            isLoading: false,
        }
    },

    methods: {

        // lista todas pessoas
        index() {

            this.isLoading = true

            axios.get(this.urlBase + 'pessoas')
                .then(response => {
                    this.isLoading = false
                    this.pessoas = response.data

                })
                .catch(error => {
                    console.error(error);
                })
        },

        // salvar pessoa
        async storePessoa(){

        // const isFormCorrect = await this.v$.$validate()

        // if (!isFormCorrect) return

        this.isLoading = true

        axios.post(this.urlBase + 'pessoas/store', this.formData)
            .then(response =>{

                if(response.status == 200) {

                   this.modal_create = false
                   this.resetForm()
                   this.index()
                   this.isLoading = false
                }
            })
            .catch(error => {
                this.isLoading = false
                console.error(error);
            })
        },

        // salvar endereço
        async storeEndereco(){

        // const isFormCorrect = await this.v$.$validate()

        // if (!isFormCorrect) return

        this.isLoading = true

        axios.post(this.urlBase + 'enderecos/store', this.formDataAddress)
            .then(response =>{

                if(response.status == 200) {
                   this.modal_address = false
                   this.resetForm()
                   this.resetFormAdress()
                   this.index()
                   this.isLoading = false
                }
            })
            .catch(error => {
                this.isLoading = false
                console.error(error);
            })
        },

        // listar tipos de endereços
        tiposEnderecos() {

            this.isLoading = true

            axios.get(this.urlBase + 'tipos_enderecos')
                .then(response => {
                    this.isLoading = false
                    this.tipos_enderecos = response.data
                })
                .catch(error => {
                    this.isLoading = false
                    console.error(error);
                })
        },


        // histórico
        historicoEnderecos(id_pessoa) {

            this.isLoading = true

            axios.get(this.urlBase + 'enderecos/show/' + id_pessoa)
                .then(response => {
                    this.isLoading = false
                    this.historico_enderecos = response.data


                })
                .catch(error => {
                    this.isLoading = false
                    console.error(error);
                })
        },

        /* Modal */
        modalCreate(){
            this.modal_create = true
        },

        // modal do endereço
        modalAddress(id_pessoa){
            // loading
            this.isLoading = true

            this.resetFormAdress()

            this.modal_address = true
            this.formDataAddress.pessoa_id = id_pessoa

            // tipos de endereços (Residencial ou Comercial)
            this.tiposEnderecos()

            axios.get(this.urlBase + 'enderecos/edit/' + id_pessoa)
            .then(response => {
                this.isLoading = false
                this.formDataAddress.cep            = response.data.cep
                this.formDataAddress.logradouro     = response.data.logradouro
                this.formDataAddress.numero         = response.data.numero
                this.formDataAddress.complemento    = response.data.complemento
                this.formDataAddress.bairro         = response.data.bairro
                this.formDataAddress.estado         = response.data.estado
                this.formDataAddress.cidade         = response.data.cidade
                this.formDataAddress.tipo_endereco_id = response.data.tipo_endereco.id_tipo_endereco
            })
            .catch(error => {
                this.isLoading = false
                console.error(error);
            })


        },

        modalHistoric(id_pessoa){
            this.modal_historic = true
            this.id_pessoa = id_pessoa
            this.historicoEnderecos(id_pessoa)
        },

        // ação de fechar o modal
         closeModal(){
            this.modal_create = false
            this.modal_address = false
            this.modal_historic = false
            // this.v$.$reset()
            this.resetForm()
        },

        // reset form
        resetForm(){
            this.formData.nome = ''
            this.formData.nome_social = ''
            this.formData.nome_pai = ''
            this.formData.nome_mae = ''
            this.formData.email = ''
            this.formData.telefone = ''
            this.formData.cpf = ''
        },

        resetFormAdress(){
            this.formDataAddress.cep = ''
            this.formDataAddress.logradouro = ''
            this.formDataAddress.tipo_endereco_id = ''
            this.formDataAddress.numero = ''
            this.formDataAddress.complemento = ''
            this.formDataAddress.bairro = ''
            this.formDataAddress.estado = ''
            this.formDataAddress.cidade = ''
        }
    },

    mounted() {
        this.index()
    }

};
</script>

<style scoped>

</style>
