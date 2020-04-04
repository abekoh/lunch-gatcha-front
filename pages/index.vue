<template>
  <v-container class="pa-md-400px">
    <PlaceSelector :search-location="searchLocation"/>
    <v-row align="start" justify="center">
      <v-col cols="4" sm="12">
        <v-btn x-large color="primary" @click="turnGatcha">ガチャを引く</v-btn>
      </v-col>
    </v-row>
    <div style="height: 80px;"/>
        <Result :result="result"/>
  </v-container>
</template>

<script>
  import PlaceSelector from "../components/PlaceSelector";
  import Result from "../components/Result";

  export default {
    components: {
      PlaceSelector,
      Result
    },
    data() {
      return {
        searchLocation: {lat: 35.68123620000001, lng: 139.7671248}, // 初期値は東京駅
        result: {
          enabled: false,
          placeId: "",
          location: {lat: 35.68123620000001, lng: 139.7671248},
          name: "",
          reviewStars: 0
        },
      }
    },
    methods: {
      async turnGatcha() {
        const request = {
          location: {
            latitude: this.searchLocation.lat,
            longtitude: this.searchLocation.lng
          }
        };
        const result = await this.$axios.$post('/places/lunchGatcha', request);
        this.$set(this.result, 'location', {
          lat: result.place.location.latitude,
          lng: result.place.location.longtitude
        });
        this.$set(this.result, 'placeId', result.place.placeId);
        this.$set(this.result, 'name', result.place.name);
        this.$set(this.result, 'reviewStars', result.place.reviewStars);
        this.$set(this.result, 'enabled', true);
      }
    }
  }
</script>
