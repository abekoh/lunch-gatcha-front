<template>
  <v-overlay :value="enabled">
    <v-progress-circular
      :size="70"
      :width="7"
      color="primary"
      indeterminate
    ></v-progress-circular>
  </v-overlay>
</template>

<script>
  export default {
    name: "Loading",
    props: ["enabled"]
  }
</script>

<style scoped>

</style>
