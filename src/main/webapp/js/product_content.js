
	$(document).ready(function(){
	  
		  $('.flexslider').flexslider({
			    animation: "slide",
			    controlNav: "thumbnails",
			    start: function(slider){
			      $('body').removeClass('loading');
			    }
		   });
	
			$('.kv-ltr-theme-svg-star').rating({
		        hoverOnClear: false,
		        theme: 'krajee-svg',
		        min:0,
		        max:5,
		        step:1,
		        size:'sm',
		        stars:5,
		        displayOnly:true,
		        showCaption:false,
			});
	 });


	// 초기값 변수
	var size = 0;
	var color = 0;
	var sizeName;
	var colorName;
	var productName = $('.productName').text();
	var price = Number($('.price').attr('id'));
	var disPrice = Number($('.disPrice').attr('id'));
	var totQty = 0;
	var total = 0;
	$('#total').text(0); // 총 상품금액 초기화 ( 0원 )
	var num = 0;
	var products = [];	// 상품 배열
	if(!$('.disPrice').length){ // 할인판매가가 존재하지 않는다면 기본판매가로 전부 적용
		disPrice = price;
	}
	var memberId = $('#memberId').val();
	var productCode = $('#productCode').val();
	
	
	// 문의게시판 리스트로 가기 
	$('.goQnaList').click(function(){
		location.href='../qna/list.do';
	});
	// 문의게시판 작성하기
	$('.goQnaWrite').click(function(){
		if(!memberId){
			alert('로그인 한 회원만 가능합니다');
			location.href='../login.do?after=product/content.do&productCode='+productCode;
			return;
		}
		location.href='../qna/write.do?selectCode='+productCode;
	});
	
	
	////////////////////////////////////////////////////////////////// 장바구니 클릭시
	$('#cart').click(function(){
		
		if(products.length == 0){	// 상품 아무것도 안고르고 장바구니 클릭시에 경고문
			alert('필수 옵션을 선택하세요');
			return;
		}else if(!memberId){
			alert('로그인 한 회원만 가능합니다');
			location.href='../login.do?after=product/content.do&productCode='+productCode;
			return;
		}
		
		// 객체 배열의 옵션들을 파라미터로 보내려고 이어붙임
		var sizeNums = '';
		var colorNums = '';
		var qtys = '';
		products.forEach(function(product){
			if(product.size !== undefined){
				sizeNums += 'sizeNum='+product.size+'&';
			}
			if(product.color !== undefined){
				colorNums += 'colorNum='+product.color+'&';
			}
			qtys += 'qty='+product.qty+'&';
		});
		
		// 이미 장바구니에 해당 아이템이 존재하는지 확인
// 		location.href='../cart/confirmCart.do?'+sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode;
		$.ajax({
			url : '../cart/confirmCart.do',
			type : 'post',
			data : sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode,
			dataType : 'html',
			success : function(data){
				$('.confirmResult').html(data);
				
				var confirmResult = $('.confirmResult').text().trim();
				if(confirmResult > 0){
					var result = confirm('중복된 상품이 존재합니다. 추가하시겠습니까? ');
					if(result){
						// 장바구니에 추가하는로직
						$.ajax({
							url : '../cart/insertCart.do',
							type : 'post',
							data : sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode,
							dataType : 'html',
							success : function(data){
								if ($('#cartResult').css('display') == 'none') {
							        $('#cartResult').css('display', 'block');
							    }
							}
						});
					}
				}else{
					// 장바구니에 추가하는 로직
					$.ajax({
						url : '../cart/insertCart.do',
						type : 'post',
						data : sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode,
						dataType : 'html',
						success : function(data){
							if ($('#cartResult').css('display') == 'none') {
						        $('#cartResult').css('display', 'block');
						    }
						}
					});
				}
			}
		});
		
	});//장바구니 클릭 로직 끝
	
//////////////////////////////////////////////////////////////////주문하기 클릭시
	$('#order').click(function(){
		
		if(products.length == 0){	// 상품 아무것도 안고르고 클릭시에 경고문
			alert('필수 옵션을 선택하세요');
			return;
		}else if(!memberId){
			alert('로그인 한 회원만 가능합니다');
			location.href='../login.do?after=product/content.do&productCode='+productCode;
			return;
		}
		
		// 객체 배열의 옵션들을 파라미터로 보내려고 이어붙임
		var sizeNums = '';
		var colorNums = '';
		var qtys = '';
		products.forEach(function(product){
			if(product.size !== undefined){
				sizeNums += 'sizeNum='+product.size+'&';
			}
			if(product.color !== undefined){
				colorNums += 'colorNum='+product.color+'&';
			}
			qtys += 'qty='+product.qty+'&';
		});
		
		// 이미 장바구니에 해당 아이템이 존재하는지 확인
		$.ajax({
			url : '../cart/confirmCart.do',
			type : 'post',
			data : sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode,
			dataType : 'html',
			success : function(data){
				$('.confirmResult').html(data);
				
				var confirmResult = $('.confirmResult').text().trim();
				if(confirmResult > 0){
					var result = confirm('중복된 상품이 존재합니다. 추가해서 주문하시겠습니까?');
					if(result){
						// 장바구니에 추가하고 주문form으로
						location.href='../order/orderProduct.do?'+sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode;
					}
				}else{
					// 장바구니에 추가하고 주문 form으로
					location.href='../order/orderProduct.do?'+sizeNums+colorNums+qtys+'memberId='+memberId+'&productCode='+productCode;
				}
			}
		});
		
	});//주문하기 클릭 로직 끝
	
	
	$('#cancel').click(function(){
		if ($('#cartResult').css('display') == 'block') {
	        $('#cartResult').css('display', 'none');
	    }
	});
	
	const getProductBoth = function(size, color, sizeName, colorName){
		var product = $('<tr>'
				+'<td class="d-flex justify-content-between align-items-center productFont">'
				+productName+' - '+sizeName+' '+colorName
				+'<img class="delete pe-2" src="../img/delete.gif">'
				+'</td>'
				+'<td>'
				+'<div class="d-flex">'
				+'<input type="text" class="form-control form-control-sm qty" name="qty" value="1" size="1" min="1" max="${product.productStock}">'
				+'<div class="d-flex flex-column justify-content-center">'
				+'<img class="plus" src="../img/up.gif">'
				+'<img class="minus" src="../img/down.gif">'
				+'</div>'
				+'</div>'
				+'</td>'
				+'<td class="obj">'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="hidden" name="sizeNum" value="'+size+'">'
				+'<input type="hidden" name="colorNum" value="'+color+'">'
				+'<input type="hidden" class="pre" value="1">'
				+'<span class="price">'+price.toLocaleString('ko-KR')+'</span>원'
				
				+'</td>'
				+'</tr>');
		num++;
		return product;
	};
	const getProductSize = function(size, sizeName){
		var product = $('<tr>'
				+'<td class="d-flex justify-content-between align-items-center productFont">'
				+productName+' - '+sizeName
				+'<img class="delete pe-2" src="../img/delete.gif">'
				+'</td>'
				+'<td>'
				+'<div class="d-flex">'
				+'<input type="text" class="form-control form-control-sm qty" name="qty" value="1" size="1" min="1" max="${product.productStock}">'
				+'<div class="d-flex flex-column justify-content-center">'
				+'<img class="plus" src="../img/up.gif">'
				+'<img class="minus" src="../img/down.gif">'
				+'</div>'
				+'</div>'
				+'</td>'
				+'<td class="obj">'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="hidden" name="sizeNum" value="'+size+'">'
				+'<input type="hidden" class="pre" value="1">'
				+'<span class="price">'+price.toLocaleString('ko-KR')+'</span>원'
				+'</td>'
				+'</tr>');
		num++;
		return product;
	};
	const getProductColor = function(color, colorName){
		var product = $('<tr>'
				+'<td class="d-flex justify-content-between align-items-center productFont">'
				+productName+' - '+colorName
				+'<img class="delete pe-2" src="../img/delete.gif">'
				+'</td>'
				+'<td>'
				+'<div class="d-flex">'
				+'<input type="text" class="form-control form-control-sm qty" name="qty" value="1" size="1" min="1" max="${product.productStock}">'
				+'<div class="d-flex flex-column justify-content-center">'
				+'<img class="plus" src="../img/up.gif">'
				+'<img class="minus" src="../img/down.gif">'
				+'</div>'
				+'</div>'
				+'</td>'
				+'<td class="obj">'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="hidden" name="colorNum" value="'+color+'">'
				+'<input type="hidden" class="pre" value="1">'
				+'<span class="price">'+price.toLocaleString('ko-KR')+'</span>원'
				+'</td>'
				+'</tr>');
		num++;
		return product;
	};
	const getProductNo = function(){
		var product = $('<tr>'
				+'<td class="productFont">'
				+productName
				+'</td>'
				+'<td>'
				+'<div class="d-flex">'
				+'<input type="text" class="form-control form-control-sm qty" name="qty" value="1" size="1" min="1" max="${product.productStock}">'
				+'<div class="d-flex flex-column justify-content-center">'
				+'<img class="plus" src="../img/up.gif">'
				+'<img class="minus" src="../img/down.gif">'
				+'</div>'
				+'</div>'
				+'</td>'
				+'<td class="obj">'
				+'<input type="hidden" class="num" value="'+num+'">'
				+'<input type="hidden" class="pre" value="1">'
				+'<span class="price">'+price.toLocaleString('ko-KR')+'</span>원'
				+'</td>'
				+'</tr>');
		num++;
		return product;
	};
	
	if($('#sizeList').length){
		
		if($('#colorList').length){	// 사이즈,색상 둘다 존재
			console.log('둘다 존재');
		
			$('#sizeList').change(function(){
				size = $(this).val();
				sizeName = $("#sizeList option:checked").text();
				console.log(sizeName);

				if(size != 0 && color != 0){	// 옵션을 제대로 골랐을 경우
					
					let product = products.find(product => product.size === size && product.color === color);	// 해당조건의 상품찾기
					if(product){
						console.log('이미 해당 옵션의 상품이 존재할경우');
						console.log(product);
						alert('중복된 상품입니다');
						return;
						
					}else{
						product = {
							"num": num,
							"size": size,
							"color": color,
							"qty": 1,
							"price": price
						}
						products.push(product);
						console.log(products);
						
						$('#result').append(getProductBoth(size, color, sizeName, colorName));
						totQty = totQty + 1;
						$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
					}
					
				}
			});
			
			$('#colorList').change(function(){
				color = $(this).val();
				colorName = $("#colorList option:checked").text();
				console.log(colorName);

				if(size != 0 && color != 0){	// 옵션을 제대로 골랐을 경우
					
					let product = products.find(product => product.size === size && product.color === color);
					if(product){
						console.log('이미 해당 옵션의 상품이 존재할경우');
						console.log(product);
						alert('중복된 상품입니다');
						return;
						
					}else{
						product = {
							"num": num,
							"size": size,
							"color": color,
							"qty": 1,
							"price": price
						}
						products.push(product);
						console.log(products);
						
						$('#result').append(getProductBoth(size, color, sizeName, colorName));
						totQty = totQty + 1;
						$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
					}
				}
			});
			
			
		}else{	// 사이즈만 존재
			console.log('사이즈만 존재');
			$('#sizeList').change(function(){
				size = $(this).val();
				sizeName = $("#sizeList option:checked").text();
				console.log(sizeName);
				
				if(size != 0){	// 옵션을 제대로 골랐을 경우
					
					let product = products.find(product => product.size === size);	// 해당조건의 상품찾기
					if(product){
						console.log('이미 해당 옵션의 상품이 존재할경우');
						console.log(product);
						alert('중복된 상품입니다');
						return;
						
					}else{
						product = {
							"num": num,
							"size": size,
							"qty": 1,
							"price": price
						}
						products.push(product);
						console.log(products);
						
						$('#result').append(getProductSize(size, sizeName));
						totQty = totQty + 1;
						$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
					}
					
				}
			});
		}
	
	}else if($('#colorList').length){	// 사이즈는 없고 색상이 존재
		console.log('색상만 존재');
		$('#colorList').change(function(){
			
			color = $(this).val();
			colorName = $("#colorList option:checked").text();
			console.log(colorName);
			
			if(color != 0){	// 옵션을 제대로 골랐을 경우
				
				let product = products.find(product => product.color === color);	// 해당조건의 상품찾기
				if(product){
					console.log('이미 해당 옵션의 상품이 존재할경우');
					console.log(product);
					alert('중복된 상품입니다');
					return;
					
				}else{
					product = {
						"num": num,
						"color": color,
						"qty": 1,
						"price": price
					}
					products.push(product);
					console.log(products);
					
					$('#result').append(getProductColor(color, colorName));
					totQty = totQty + 1;
					$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
				}
				
			}
		});
		
	}else{							// 둘다 미존재
		console.log('둘다 없음');
		
		// 옵션으로 나눌필요가없다 시작부터 tr 하나 주면됨
		
		product = {
			"num": num,
			"qty": 1,
			"price": price
		}
		products.push(product);
		console.log(products);
		
		$('#result').append(getProductNo());
		totQty = totQty + 1;
		$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
		
	}
	

	/////////////////////////////////////////////////////////////////// 상품의 수량 증가 혹은 감소 버튼
	$(document).on("click",".plus",function(){
		
		var num = Number($(this).parents('tr').find('.num').val());
		
		console.log(num);
		let product = products.find(product => product.num === num);
		console.log(product.qty);
		product.qty = product.qty + 1;
		console.log(products);
		
		$(this).parents('tr').find('.qty').val(product.qty);
		$(this).parents('tr').find('.pre').val(product.qty);
		totQty = totQty + 1;
		$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
		$(this).parents('tr').find('.price').text((product.qty * price).toLocaleString('ko-KR'));
		
	});
	$(document).on("click",".minus",function(){
		
		var num = Number($(this).parents('tr').find('.num').val());
		
		console.log(num);
		let product = products.find(product => product.num === num);
		console.log(product.qty);
		if(product.qty -1 < 1){
			alert('최소 수량은 1개 이상입니다');
			return;
		}
		product.qty = product.qty - 1;
		console.log(products);
		
		$(this).parents('tr').find('.qty').val(product.qty);
		$(this).parents('tr').find('.pre').val(product.qty);
		totQty = totQty - 1;
		$('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
		$(this).parents('tr').find('.price').text((product.qty * price).toLocaleString('ko-KR'));
	});
	
	////////////////////////////////////////////////////// 상품의 수량 변경을 직접적으로 입력
	$(document).on("change",".qty",function(){
		
		if($(this).val() < 1){
			alert('최소 수량은 1개 이상입니다');
			$(this).val(1);
		}
		
		var num = Number($(this).parents('tr').find('.num').val());		// 클릭한 tr태그의 객체 번호
		console.log(num);
		let product = products.find(product => product.num === num);	// 객체 정보
		
		var pre = product.qty;
		console.log('원래 수량 : ' + pre);
		console.log(products);
		
		var after = Number($(this).val());
		console.log('바뀐 수량 : ' + after);
		
		totQty = totQty + (after - pre);
        console.log('총수량 : ' + totQty);
        
        $('#total').text((totQty * disPrice).toLocaleString('ko-KR'));
        $(this).parents('tr').find('.pre').val(after);
        product.qty = after;
        $(this).parents('tr').find('.price').text((product.qty * price).toLocaleString('ko-KR'));
	});
	
	///////////////////////////////////////////////////////// 상품 삭제
	$(document).on("click",".delete",function(){
		
		console.log(products);
		var num = Number($(this).parents('tr').find('.num').val());		// 클릭한 tr태그의 객체 번호
		let product = products.find(product => product.num === num);	// 객체 정보
		var qty = product.qty;											// 객체의 수량
		console.log('객체의 수량 : '+qty);
		totQty = totQty - qty;
		console.log('총수량 : ' + totQty);
		$('#total').text(totQty * disPrice);							// totQty 수정 , total 결과 뿌리기
		
		products = products.filter(product => product.num !== num);		// 배열 수정
		console.log('배열바뀜');
		console.log(products);
		
		$(this).parents('tr').remove();									// tr 태그 삭제
		
	});

	