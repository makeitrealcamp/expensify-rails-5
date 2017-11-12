window.onload = function () {
  var chart = new CanvasJS.Chart("expenses-chart", $('.temp_information').data('temp'))
  chart.render();
}
// QUEMADA
// window.onload = function () {
//   var chart = new CanvasJS.Chart("expenses-chart", {
//     animationEnabled: true,
//     title:{
//       text:"Last 6 months"
//     },
//     axisX: {
//       interval:1,
//       intervalType:"month"
//     },
//     axisY: {
//       prefix:"$"
//     },
//     backgroundColor:"#303336",
//     data: [{
//       name:"Compra",
//       showInLegend:true,
//       type:"column",
//       dataPoints: [
//         {x: "Nov-2017", y: 0},
//         {x: "Oct-2017", y: 9367401},
//         {x: "Sep-2017", y: 9016934},
//         {x: "Aug-2017", y: 8586328},
//         {x: "Jul-2017", y: 16507019},
//         {x: "Jun-2017", y: 7804454}
//       ]
//     },
//     {
//       name:"Compra",
//       showInLegend:true,
//       type:"Retiro",
//       dataPoints: [
//         {x: "Nov-2017", y: 1000000},
//         {x: "Oct-2017", y: 7893158},
//         {x: "Sep-2017", y: 6866273},
//         {x: "Aug-2017", y: 23442145},
//         {x: "Jul-2017", y: 7220751},
//         {x: "Jun-2017", y: 8819400}
//       ]
//     },
//     {
//       name:"Compra",
//       showInLegend:true,
//       type:"Transferencia",
//       dataPoints: [
//         {x: "Nov-2017", y: 3465942},
//         {x: "Oct-2017", y: 12022727},
//         {x: "Sep-2017", y: 11587629},
//         {x: "Aug-2017", y: 12177278},
//         {x: "Jul-2017", y: 25356801},
//         {x: "Jun-2017", y: 9560185}
//       ]
//     },
//     {
//       name:"Compra",
//       showInLegend:true,
//       type:"Pago",
//       dataPoints: [
//         {x: "Nov-2017", y: 0},
//         {x: "Oct-2017", y: 9700176},
//         {x: "Sep-2017", y: 5560115},
//         {x: "Aug-2017", y: 687724},
//         {x: "Jul-2017", y: 12506502},
//         {x: "Jun-2017", y: 2930201}
//       ]
//     }]
//   });
//   chart.render();
//
// }

//EJEMPLO
// window.onload = function () {
//
// var chart = new CanvasJS.Chart("expenses-chart", {
// 	animationEnabled: true,
// 	title:{
// 		text: "Composition of Internet Traffic in North America"
// 	},
// 	axisX: {
// 		interval: 1,
// 		intervalType: "year",
// 		valueFormatString: "YYYY"
// 	},
// 	axisY: {
// 		suffix: "%"
// 	},
// 	toolTip: {
// 		shared: true
// 	},
// 	legend: {
// 		reversed: true,
// 		verticalAlign: "center",
// 		horizontalAlign: "right"
// 	},
// 	data: [{
// 		type: "stackedColumn100",
// 		name: "Real-Time",
// 		showInLegend: true,
// 		xValueFormatString: "YYYY",
// 		yValueFormatString: "#,##0\"%\"",
// 		dataPoints: [
// 			{ x: new Date(2010,0), y: 40 },
// 			{ x: new Date(2011,0), y: 50 },
// 			{ x: new Date(2012,0), y: 60 },
// 			{ x: new Date(2013,0), y: 61 },
// 			{ x: new Date(2014,0), y: 63 },
// 			{ x: new Date(2015,0), y: 65 },
// 			{ x: new Date(2016,0), y: 67 }
// 		]
// 	},
// 	{
// 		type: "stackedColumn100",
// 		name: "Web Browsing",
// 		showInLegend: true,
// 		xValueFormatString: "YYYY",
// 		yValueFormatString: "#,##0\"%\"",
// 		dataPoints: [
// 			{ x: new Date(2010,0), y: 28 },
// 			{ x: new Date(2011,0), y: 18 },
// 			{ x: new Date(2012,0), y: 12 },
// 			{ x: new Date(2013,0), y: 10 },
// 			{ x: new Date(2014,0), y: 10 },
// 			{ x: new Date(2015,0), y: 7 },
// 			{ x: new Date(2016,0), y: 5 }
// 		]
// 	},
// 	{
// 		type: "stackedColumn100",
// 		name: "File Sharing",
// 		showInLegend: true,
// 		xValueFormatString: "YYYY",
// 		yValueFormatString: "#,##0\"%\"",
// 		dataPoints: [
// 			{ x: new Date(2010,0), y: 15 },
// 			{ x: new Date(2011,0), y: 12 },
// 			{ x: new Date(2012,0), y: 10 },
// 			{ x: new Date(2013,0), y: 9 },
// 			{ x: new Date(2014,0), y: 7 },
// 			{ x: new Date(2015,0), y: 5 },
// 			{ x: new Date(2016,0), y: 1 }
// 		]
// 	},
// 	{
// 		type: "stackedColumn100",
// 		name: "Others",
// 		showInLegend: true,
// 		xValueFormatString: "YYYY",
// 		yValueFormatString: "#,##0\"%\"",
// 		dataPoints: [
// 			{ x: new Date(2010,0), y: 17 },
// 			{ x: new Date(2011,0), y: 20 },
// 			{ x: new Date(2012,0), y: 18 },
// 			{ x: new Date(2013,0), y: 20 },
// 			{ x: new Date(2014,0), y: 20 },
// 			{ x: new Date(2015,0), y: 23 },
// 			{ x: new Date(2016,0), y: 27 }
// 		]
// 	}]
// });
// chart.render();
//
// }
