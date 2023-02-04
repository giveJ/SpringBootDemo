console.log("Reply Module......");

var replyService = (function(){

	function add(reply, callback){
		console.log("reply......");
		
		$.ajax({
			type:'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	//---------------------------------------end

	function getList(param, callback, error){
		var product_id = param.product_id;
		
		$.ajax({
			type:'get',
			url : '/replies/pages/' + product_id + '/1.json',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	//---------------------------------------
	function remove(rno, callback, error){
		$.ajax({
			type:'delete',
			url : '/replies/' + rno,
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	//---------------------------------------
	function update(reply, callback, error){
		$.ajax({
			type:'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result, status, xhr){
				console.log("modify result ??? : " + result);
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	//---------------------------------------
	function get(rno, callback, error){
		console.log("get reply ... " + rno);
	
		$.ajax({
			type:'get',
			url : '/replies/' + rno + '.json',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	

	return {
			add:add,	//변수명.호출명
			getList:getList,
			remove:remove,
			update:update,
			get:get
			};

})();	//즉시 실행 함수: 명시하는 것과 동시에 메모리에 등록.