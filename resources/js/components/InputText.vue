<template>
    <label :for="id.toLowerCase()" class="font-normal">{{ label }}</label> <span v-if="required != 'false'" class="required">*</span><br>
    <input
        :type="type"
        :id="id"
        class="form-control"
        :value="modelValue"
        @input="updateValue"
        :disabled="disabled"
        :placeholder="placeholder"
        :maxlength="maxlength"
        @keypress="formatName"
        :autofocus="autofocus"
        v-show="show"
        required
    >
</template>

<script>
    export default{
        props: {
            id: String,
            name: String,
            label: String,
            disabled: Boolean,
            placeholder: String,
            maxlength: String,
            modelValue: [String, Number],
            autofocus: Boolean,
            type: String,
            fName: Boolean,
            required: String,
            show: {
                type: Boolean,
                default: true
            }
        },

        methods: {

            updateValue(event) {
                this.$emit('update:modelValue', event.target.value);
            },

            formatName(e) {
                if(this.fName == true) {
                    let char = String.fromCharCode(e.keyCode);
                    if (/^[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ\s\.]+$/.test(char)) return true;
                    else e.preventDefault();
                } else {
                    return false
                }
            }
        },
    }
</script>
