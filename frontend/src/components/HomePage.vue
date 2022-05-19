<template>
  <div class="home">
      <div>
        <img src="@/assets/home.jpg" alt="home">
      </div>
      <h1>Welcome Home</h1>
      <pre>
        This is database study project called "Construction Database".
        What can you do on this lonely website?

          ○ Find brief info about tables and relationships
          ○ Select interesting table and check out its records
          ○ Choose queries with certain parameters and get filtered info

        Enjoy~
      </pre>
  </div>
</template>

<script>
export default {
  name: "HomePage"
}
</script>

<style scoped>

home {
  margin: 20px;
  text-align: center;
}

h1 {
  margin-top: 30px;
  margin-right: 100px;
  font-size: 55px;
  font-family: "Akshar";
}

img {
  float: left;
  height: 840px;
  margin-left: 10px;
  margin-right: 180px;
  width: 650px;
}
pre {
  text-align: justify;
  margin-right: 120px;
  margin-top: 200px;
  font-size: 35px;
  font-family: "Akshar";
}
</style>