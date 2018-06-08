var schema = function(){

	return {

		getData:function(){

			d3.csv('CalD3/data/data.csv',function(d,e){
				vis.generate(d);
			});
		},
		generate:function(csvData){

			//color function: takes value of data, returns class string

			var color = d3.scale.quantize()
			//change if % is bigger or lower
			    .domain([-1, 1])
			    .range(d3.range(11).map(function(d) { return "q" + d + "-11"; }));

			//appending SVG to div

			d3.select('#vis').append('svg');

			//set up 4 SVG "groups" -- one for each witness

			var data = [1,2,3,4];

			var cellWidth = 50;

			var witnessGroups = d3.select('svg')
				.selectAll('g.witnessGroups')
				.data(data);
			witnessGroups.enter().append('g')
				.classed('witnessGroups',true);
			witnessGroups
				.attr('class',function(d){
					return 'witnessGroups _' +d;
				})
				.attr('transform',function(d,i){
					var x = cellWidth,
						y = i*75 +cellWidth;
					return 'translate(' + x + ',' + y + ')';
				})
			witnessGroups.exit().remove();
			
			var cells = witnessGroups
				.selectAll('rect.cell')
				.data(csvData);
			cells.enter().append('rect')
				.classed('cell',true);
			cells
				.attr("class", function(d) { 
					var parentClass = d3.select(this.parentElement).attr('class').split(' ')[1].split('_')[1],
						columnString = 'perc_w' +parentClass,
						columnValue = columnString !== "perc_w1" ? parseFloat(d[columnString]) : 0;

					//ignore if first witness
					return "cell " + color(columnValue); 
				})
				.attr('x',function(d,i){
					return i*cellWidth;
				})
				.attr('y',0)
				.attr('width',cellWidth)
				.attr('height',cellWidth);
			cells.exit().remove();
		}
	}
}

var vis = schema();
vis.getData();