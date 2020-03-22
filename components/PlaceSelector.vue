<template>
  <div>
    <v-row align="start" justify="center">
      <v-col cols="12" sm="4">
        <v-btn block color="primary" @click="setCurrentPlace">現在地を取得</v-btn>
      </v-col>
      <v-col cols="12" sm="1" align="center">
        <p>OR</p>
      </v-col>
      <v-col cols="12" sm="4">
        <v-text-field solo label="場所を入力" append-icon="search"/>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12">
        <GmapMap
          :center="searchLocation"
          :zoom="16"
          map-type-id="roadmap"
          style="height: 500px"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script>
  export default {
    name: "PlaceSelector",
    props: ["searchLocation"],
    methods: {
      async setCurrentPlace() {
        const geoPosition = await getCurrentPlace();
        this.$set(this.searchLocation, 'lat', geoPosition.coords.latitude);
        this.$set(this.searchLocation, 'lng', geoPosition.coords.longitude);
      }
    }
  }
  const getCurrentPlace = (options) => {
    return new Promise(((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resolve, reject, options);
    }))
  }
</script>

<style scoped>

</style>
