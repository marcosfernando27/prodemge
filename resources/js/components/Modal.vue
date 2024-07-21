<template>
    <div class="w-full min-w-screen min-h-screen animate faster fixed left-0 top-0 flex justify-center items-center inset-0 outline-none focus:outline-none bg-no-repeat bg-center bg-cover overflow-y-scroll max-y-scroll pt-5 pb-5" id="modal-id" style="z-index: 9999;"
        v-show="exibir">
        <div class="absolute bg-black opacity-80 inset-0 z-0"></div>
        <div :class="size + ' max-lg pb-3 relative mx-auto my-auto rounded-xl shadow-lg bg-white'">
            <!--body-->
            <div class="pl-5 pr-5 pt-1 pb-1">

                <div class="flex items-center mb-3 border-b border-stone-200">
                    <span v-if="icon == 'create'">
                                <PlusIcon class="w-7 h-7 flex mr-3 text-blue-600"></PlusIcon>
                            </span>
                    <span v-else-if="icon == 'edit'">
                                <PencilIcon class="w-7 h-7 flex mr-3 text-blue-600"></PencilIcon>
                            </span>
                    <span v-else-if="icon == 'destroy'">
                                <TrashIcon class="w-7 h-7 flex mr-3 text-red-500"></TrashIcon>
                            </span>

                    <h3 class="font-light md:block py-3 text-2xl">{{ title }}</h3>
                </div>
                <slot></slot>
            </div>
            <!--footer-->
        </div>
    </div>
</template>

<script>
import { PencilIcon, PlusIcon, TrashIcon, PaperAirplaneIcon, CalendarDaysIcon } from '@heroicons/vue/24/outline'

export default {

    components: {
        PlusIcon,
        PencilIcon,
        TrashIcon,
        PaperAirplaneIcon,
        CalendarDaysIcon
    },

    props: {
        exibir: Boolean,
        btnTitle: String,
        size: String,
        icon: String,
        title: String
    },

    methods: {

        cancelar() {
            this.exibir = false;
        }
    }
}
</script>
