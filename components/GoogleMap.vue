<template>
  <v-card>
    <GmapMap
      :center="centerLocation"
      :zoom="16"
      map-type-id="roadmap"
      :style="gMapHeight"
      :options="{
        rotateControl: false,
        streetViewControl: false,
        zoomControl: false,
        fullscreenControl: false,
        mapTypeControl: false,
      }"
    >
      <GmapMarker :position="centerLocation">
      </GmapMarker>
    </GmapMap>
  </v-card>
</template>

<script>
  export default {
    name: "GoogleMap",
    props: ["centerLocation"],
    computed: {
      gMapHeight() {
        switch (this.$vuetify.breakpoint.name) {
          case 'xs':
          case 'sm':
            return 'height: 460px';
          default:
            return 'height: 650px';
        }
      }
    }
  }
</script>

<style scoped>

</style>
