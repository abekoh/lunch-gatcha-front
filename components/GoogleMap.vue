<template>
  <v-card>
    <GmapMap
      :center="location"
      :zoom="16"
      map-type-id="roadmap"
      :style="gMapHeight"
    />
  </v-card>
</template>

<script>
  export default {
    name: "GoogleMap",
    props: ["location"],
    computed: {
      gMapHeight() {
        switch (this.$vuetify.breakpoint.name) {
          case 'xs':
          case 'sm':
            return 'height: 400px';
          default:
            return 'height: 500px';
        }
      }
    }
  }
</script>

<style scoped>

</style>
