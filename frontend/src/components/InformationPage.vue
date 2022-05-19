<template>
  <div class="about">
    <div>
      <img src="@/assets/about.jpg" alt="home">
    </div>
    <h1>Lets meet with DB</h1>
    <pre>
      An organisation signs a contract with employer (private company, city administration and etc.)
      A construction organisation consists of several managements, which manage work process on sites.
      On every site can be several objects and one header. The header manages engineer technical workers
      (technicians, technologiests and engineers). Labours (bricklayer, finishers and etc.) are
      united in brigades and managed by a brigadier. The brigade or several brigades are doing work types
      (water supply, brick laying, installation doors and etc.) on objects.
      Different kinds of objects are constructing:
        ○ Buildings
            ○ Residential buildings (houses)
            ○ Nonresidential buildings (schools, hospitals)
        ○ Paths (bridges, roads)
      Every category has own unique attributes and features.
      Special building equipment is given to management which is later contributed on certain objects.
      For correct work organisation schedule (deadline of certain type of work) and estimate (number
      and price of every material is used) are made for every object.
      After finishing work on object report is done.

      </pre>
  </div>
</template>

<script>
export default {
  name: "InformationPage"
}
</script>

<style scoped>

about {
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
  margin-right: 50px;
  width: 650px;
}
pre {
  text-align: justify;
  margin-right: 120px;
  margin-top: 60px;
  font-size: 30px;
  font-family: "Akshar";
}
</style>