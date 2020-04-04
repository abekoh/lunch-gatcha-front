<template>
  <div>
    <Loading :enabled="loading"/>
    <v-row align="start" justify="center">
      <v-col cols="4" sm="2">
        <v-btn block large color="primary" height="50" @click="setCurrentPlace">現在地を取得</v-btn>
      </v-col>
      <v-col cols="8" sm="6">
        <v-form @submit="setPlaceByKeyword" @submit.prevent>
          <v-text-field solo label="場所を検索" height="50" append-icon="search" v-model="keyword" class="pb-0"
                        @click:append="setPlaceByKeyword"/>
        </v-form>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12">
        <GoogleMap :center-location="searchLocation"/>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  import Loading from "./Loading";
  import GoogleMap from "./GoogleMap";

  export default {
    components: {
      Loading,
      GoogleMap
    },
    name: "PlaceSelector",
    props: ["searchLocation"],
    data() {
      return {
        keyword: "",
        loading: false
      }
    },
    methods: {
      async setCurrentPlace() {
        this.$set(this, 'loading', true);
        const geoPosition = await getCurrentPlace();
        this.$set(this, 'loading', false);
        this.$set(this.searchLocation, 'lat', geoPosition.coords.latitude);
        this.$set(this.searchLocation, 'lng', geoPosition.coords.longitude);
      }
      ,
      async setPlaceByKeyword() {
        this.$set(this, 'loading', true);
        const getUrl = encodeURI('/places?keyword=' + this.keyword);
        this.$set(this, 'loading', false);
        const position = await this.$axios.$get(getUrl);
        this.$set(this.searchLocation, 'lat', position.location.latitude);
        this.$set(this.searchLocation, 'lng', position.location.longtitude);
      }
    }
  }
  const getCurrentPlace = (options) => {
    return new Promise(((resolve, reject) => {
      navigator.geolocation.getCurrentPosition(resolve, reject, options);
    }))
  };
</script>

<style scoped>

</style>
