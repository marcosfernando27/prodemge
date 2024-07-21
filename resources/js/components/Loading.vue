<template>
    <div class="loading-overlay" v-if="isLoading">
      <span class="loader"></span>
    </div>
  </template>

  <script>
  export default {
    name: 'Loading',
    props: {
      isLoading: {
        type: Boolean,
        required: true
      }
    }
  };
  </script>

  <style scoped>
  .loading-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 9999;
    }
    .loader {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        display: inline-block;
        border-top: 3px solid #FFF;
        border-right: 3px solid transparent;
        box-sizing: border-box;
        animation: rotation 1s linear infinite;
    }

    @keyframes rotation {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
    }
</style>
