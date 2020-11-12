<template>
  <div class="dashboard-editor-container">

    <el-row :gutter="32">
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <raddar-chart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <pie-chart />
        </div>
      </el-col>
      <el-col :xs="24" :sm="24" :lg="8">
        <div class="chart-wrapper">
          <bar-chart />
        </div>
      </el-col>
    </el-row>
    <el-row style="background:#fff;padding:16px 16px 0;margin-bottom:32px;">
      <line-chart :chart-data="lineChartData" />
    </el-row>


    <panel-group @handleSetLineChartData="handleSetLineChartData" />

  </div>
</template>

<script>
  import PanelGroup from './dashboard/PanelGroup'
  import LineChart from './dashboard/LineChart'
  import RaddarChart from './dashboard/RaddarChart'
  import PieChart from './dashboard/PieChart'
  import BarChart from './dashboard/BarChart'

  const lineChartData = {
    newVisitis: {
      expectedData: [10, 120, 161, 134, 105, 160, 165],
      actualData: [12, 82, 91, 154, 162, 140, 145]
    },
    messages: {
      expectedData: [20, 192, 120, 144, 160, 130, 140],
      actualData: [18, 160, 151, 106, 145, 150, 130]
    },
    purchases: {
      expectedData: [8, 100, 121, 104, 105, 90, 100],
      actualData: [12, 90, 100, 138, 142, 130, 130]
    },
    shoppings: {
      expectedData: [10, 140, 141, 142, 145, 150, 160],
      actualData: [10, 82, 91, 154, 162, 140, 130]
    }
  }

  export default {
    name: 'Index',
    components: {
      PanelGroup,
      LineChart,
      RaddarChart,
      PieChart,
      BarChart
    },
    data() {
      return {
        lineChartData: lineChartData.newVisitis
      }
    },
    methods: {
      handleSetLineChartData(type) {
        this.lineChartData = lineChartData[type]
      }
    }
  }
</script>

<style lang="scss" scoped>
  .dashboard-editor-container {
    padding: 32px;
    background-color: rgb(240, 242, 245);
    position: relative;

    .chart-wrapper {
      background: #fff;
      padding: 16px 16px 0;
      margin-bottom: 32px;
    }
  }

  @media (max-width:1024px) {
    .chart-wrapper {
      padding: 8px;
    }
  }
</style>
