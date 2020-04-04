<template>
  <div id="result">
    <v-row align="start" justify="center" class="mt-500px">
      <v-col cols="12">
        <p class="display-2 text-center">{{ result.name }}</p>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12" align="center">
        <v-rating half-increments v-model="result.reviewStars"/>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12">
        <GoogleMap :location="result.location"/>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="6">
        <v-btn x-large color="primary">Google Mapで開く</v-btn>
      </v-col>
      <v-col cols="6">
        <v-btn x-large color="primary">もう一度引く</v-btn>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  import GoogleMap from "./GoogleMap";

  export default {
    name: "Result",
    components: {
      GoogleMap
    },
    props: ["result"],
    data() {
      return {
      }
    }
  }
</script>

<style scoped>

</style>
