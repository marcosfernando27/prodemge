<template>
    <button :type="type" :class="className">

        <span v-if="icon == 'create'">
            <PlusIcon class="icon_btn" />
        </span>

        <span v-if="icon == 'address'">
            <MapPinIcon class="icon_btn w-5 h-5" />
        </span>

        <span v-if="icon == 'time'">
            <ClockIcon class="icon_btn w-5 h-5" />
        </span>

        {{ title }}
      </button>
</template>

<script>
import {
    PlusIcon,
    MapPinIcon,
    ClockIcon
} from "@heroicons/vue/24/outline";

export default {

    components: {
        PlusIcon,
        MapPinIcon,
        ClockIcon
    },

    name: "Button",
    props: {
        title: String,
        className: String,
        icon: String,
        type: String,
    },
};
</script>
