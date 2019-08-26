<template>
  <div class="progressBar">
    <div class="display-percentage">{{ percent }}%</div>
    <div class="loading-bar">
      <div class="percentage" :style="{'width' : percentage + '%'}">

      </div>
    </div>
  </div>
</template>
  
<script>
import { setInterval, clearInterval } from 'timers';
export default {
  name:'progressBar',
  data: () => {
    return {
      percentage: 0,
    }
  },
  computed: {
    percent(){
      return this.percentage.toFixed()
    }
  },
  created(){
    const intval = setInterval(() => {
      if (this.percentage < 100) {
        this.percentage += .1;
      } else 
      clearInterval(intval)
    },10)
  },
}
</script>

<style lang="scss" scoped>
  .progressBar {
    color: #555;
  }
  
  .display-percentage {
    padding-bottom: 10px;
  }

  .loading-bar {
    position: relative;
    width: 400px;
    height: 30px;
    border-radius: 15px;
    overflow: hidden;
    border-bottom-color: 1px solid #ddd;
    box-shadow: inset 0 1px 2px rgba($color: #000, $alpha: .4),
                      0 -1px 1px #333, 0 1px 0 #555;
    .percentage {
      position: absolute;
      top: 1px; left: 1px; right: 1px;
      display: block;
      height: 100%;
      border-radius: 15px;
      background-color: #4af4e3;
      background-size: 30px 30px;
      background-image: linear-gradient(135deg, rgba($color: #fff, $alpha: .15)25%, transparent 25%,
                          transparent 50%, rgba($color: #fff, $alpha: .15)50%,
                          rgba($color: #fff, $alpha: .15)75%, transparent 75%,
                          transparent); 
      animation: animate-stripes 3s linear infinite;
    }
  }

  @keyframes animate-stripes{
    0% { background-position: 0 0;}
    100% { background-position: 60px 0;}
  }
</style>

