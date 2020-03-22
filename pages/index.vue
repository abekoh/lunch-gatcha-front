<template>
  <v-container class="pa-md-400px">
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
          :center="location"
          :zoom="16"
          map-type-id="roadmap"
          style="height: 500px"
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    components: {
    },
    data() {
      return {
        location: {lat: 35.68123620000001, lng: 139.7671248} // 初期値は東京駅
      }
    },
    methods: {
      async setCurrentPlace() {
        const geoPosition = await getCurrentPlace();
        this.$set(this.location, 'lat', geoPosition.coords.latitude);
        this.$set(this.location, 'lng', geoPosition.coords.longitude);
      }
    }
  }
  const getCurrentPlace = (options) => {
    return new Promise(((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resolve, reject, options);
    }))
  }
</script>
