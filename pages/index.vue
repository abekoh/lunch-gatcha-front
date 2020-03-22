<template>
  <v-container class="pa-md-400px">
    <PlaceSelector :search-location="searchLocation"/>
    <v-row align="start" justify="center">
      <v-btn x-large color="primary">ガチャを引く</v-btn>
    </v-row>
    <div style="height: 80px;"/>
    <Result :result-location="resultLocation"/>
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
        resultLocation: {lat: 35.68123620000001, lng: 139.7671248}
      }
    }
  }
</script>
