<template>
  <v-container class="pa-md-400px">
    <Loading :enabled="loading"/>
    <PlaceSelector :search-location="searchLocation"/>
    <v-row align="start" justify="center">
      <v-col cols="6" sm="12" align="center">
        <v-btn x-large color="primary" @click="turnGatcha">ガチャを引く</v-btn>
      </v-col>
    </v-row>
    <div style="height: 80px;"/>
    <Result v-if="result.enabled" :result="result"/>
  </v-container>
</template>

<script>
  import PlaceSelector from "../components/PlaceSelector";
  import Result from "../components/Result";
  import Loading from "../components/Loading";

  export default {
    components: {
      PlaceSelector,
      Result,
      Loading
    },
    data() {
      return {
        loading: true,
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
    mounted() {
      setTimeout(() => {
        this.loading = false;
      }, 1000)
    },
    methods: {
      async turnGatcha() {
        const request = {
          location: {
            latitude: this.searchLocation.lat,
            longtitude: this.searchLocation.lng
          }
        };
        this.$set(this, 'loading', true);
        const result = await this.$axios.$post('/places/lunchGatcha', request);
        this.$set(this, 'loading', false);
        this.$set(this.result, 'location', {
          lat: result.place.location.latitude,
          lng: result.place.location.longtitude
        });
        this.$set(this.result, 'placeId', result.place.placeId);
        this.$set(this.result, 'name', result.place.name);
        this.$set(this.result, 'reviewStars', result.place.reviewStars);
        this.$set(this.result, 'enabled', true);
        // 結果表示後、スクロール
        this.$nextTick(() => {
          this.$vuetify.goTo('#result');
        });
      }
    }
  }
</script>
