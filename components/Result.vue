<template>
  <div>
    <v-row align="start" justify="center" class="mt-500px">
      <v-col cols="12" class="pa-0">
        <p class="display-1 text-center" id="result">{{ result.name }}</p>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12" align="center" class="pa-0">
        <v-rating half-increments readonly v-model="result.reviewStars"/>
      </v-col>
    </v-row>
    <v-row align="start" justify="center">
      <v-col cols="12">
        <GoogleMap :center-location="result.location"/>
      </v-col>
    </v-row>
    <v-row align="start" justify="center" class="text-center">
      <v-col cols="12" sm="3">
        <v-btn block x-large color="primary" @click="reTurnGatcha">もう一度引く</v-btn>
      </v-col>
      <v-col cols="6" sm="3">
        <v-btn block x-large :href="result.url" target="_blank" rel="noopener">Google Mapで開く</v-btn>
      </v-col>
      <v-col cols="6" sm="3">
        <v-btn block x-large @click="goTop">場所を選び直す</v-btn>
      </v-col>
    </v-row>
    <div style="height: 200px"></div>
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
    },
    methods: {
      reTurnGatcha() {
        this.$emit("re-turn-gatcha")
      },
      goTop() {
        this.$emit("go-top")
      }
    }
  }
</script>

<style scoped>

</style>
