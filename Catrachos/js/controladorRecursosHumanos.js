$(document).ready(function(){

estadisticas();

});

function estadisticas(){
	$("#div-empleados").hide();
	$("#div-planilla").hide();
	$("#div-graficos").show();
}

function empleados(){
	$("#div-empleados").show();
	$("#div-planilla").hide();
	$("#div-graficos").hide();
}
/*
function formularioActivado(){
	$("#div-gerentes").show();
	$("#div-meseros").hide();
}

*/

function planilla(){
	$("#div-empleados").hide();
	$("#div-planilla").show();
	$("#div-graficos").hide();
	$('#tabla-planilla').DataTable();
}

//Grafico del personal
let myChartPersonal = document.getElementById('myChartPersonal').getContext('2d');
//Global Options
Chart.defaults.global.defaultFontFamily = 'Lato';
Chart.defaults.global.defaultFontSize = 18;
Chart.defaults.global.defaultFontColor = '#777';

let massPopChart = new Chart(myChartPersonal, {

	type: 'bar', //bar, horizontalBar, pie, line, doughnout, radar, polarArea
	data:{
		labels: ['Gerente', 'Cocineros', 'Cajeros', 'Meseros'],
		datasets:[{
			label: 'Personal',
			data:[
				2,
				4,
				3,
				5
			],
			//backgroundColor:'green'
			backgroundColor:[
				'rgba(255, 99, 132, 0.6)',
				'rgba(54, 162, 235, 0.6)',
				'rgba(255, 206, 86, 0.6)',
				'rgba(153, 102, 255, 0.6)'
			],
			borderWidth:1,
			borderColor:'#777',
			hoverBorderWidth:'3',
			hoverBorderColor:'#000'

		}]
	},
	options:{
		title:{
			display:true,
			text: 'Personal del Restaurante',
			fontSize:25
		},
		legend:{
			display:true,
			position:'right',
			labels:{
				fontColor:'#000'
			}
		},
		layout:{
			padding:{
				left:0,
				right:0,
				bottom:0,
				top:0
			}
		},
		tooltips:{
			enabled:true
		}
	}


});	


//Grafico de Salarios
let myChartSalarios = document.getElementById('myChartSalarios').getContext('2d');
//Global Options
Chart.defaults.global.defaultFontFamily = 'Lato';
Chart.defaults.global.defaultFontSize = 18;
Chart.defaults.global.defaultFontColor = '#777';

let massPipChart = new Chart(myChartSalarios, {

	type: 'line', //bar, horizontalBar, pie, line, doughnout, radar, polarArea
	data:{
		labels: ['Pedro', 'Lucas', 'Juan', 'Thomas'],
		datasets:[{
			label: 'Personal',
			data:[
				22000,
				43000,
				13000,
				52000
			],
			//backgroundColor:'green'
			backgroundColor:[
				'rgba(255, 99, 132, 0.6)',
				'rgba(54, 162, 235, 0.6)',
				'rgba(255, 206, 86, 0.6)',
				'rgba(153, 102, 255, 0.6)'
			],
			borderWidth:1,
			borderColor:'#777',
			hoverBorderWidth:'3',
			hoverBorderColor:'#000'

		}]
	},
	options:{
		title:{
			display:true,
			text: 'Salarios del Restaurante',
			fontSize:25
		},
		legend:{
			display:true,
			position:'right',
			labels:{
				fontColor:'#000'
			}
		},
		layout:{
			padding:{
				left:100,
				right:0,
				bottom:0,
				top:0
			}
		},
		tooltips:{
			enabled:true
		}
	}


});	
