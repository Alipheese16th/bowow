	
	var memberId = $('#memberId').val();
	//var products = [];
	
	// 이미지나 상품명 누르면 상품상세보기로 이동
	$('.titleImg').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '../product/content.do?productCode='+productCode;
	});
	$('.title').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '../product/content.do?productCode='+productCode;
	});
	
/* 	/////// 체크박스 선택시 상품 객체배열로 저장 , 선택 해제시 객체배열에서 삭제
	$('.chk').change(function(){
		console.log($(this).val);
		var num = $(this).parents('.plist').find('.num').val();
		var productCode = $(this).parents('.plist').attr('id');
		var sizeNum = $(this).parents('.plist').find('.sizeNum').attr('id');
		var colorNum = $(this).parents('.plist').find('.colorNum').attr('id');
		var qty = $(this).parents('.plist').find('.qty').val();
		var cost = $(this).parents('.plist').find('.cost').attr('id');
		if($('.chk').is(':checked')){	// 체크박스 선택
			let product = {
				"num": num,
				"productCode": productCode,
				"sizeNum": sizeNum,
				"colorNum": colorNum,
				"qty": qty,
				"cost": cost
			}
			products.push(product);
			console.log(products);
		}else{	// 체크박스 해제
			products = products.filter(product => product.num !== num);		// 배열 수정
			console.log('배열바뀜');
			console.log(products);
		}
	});// 체크박스로직 */
	
	// 전체체크박스 선택시 전체선택
	$('.chkAll').change(function(){
		if($('.chkAll').is(':checked')){
			$('.chk').prop('checked',true);
		}else{
			$('.chk').prop('checked',false);
		}
	});
	
	///////// 상품 수량 업데이트
	$('.change').click(function(){
		var productCode = $(this).parents('.plist').attr('id');
		var qty = $(this).parents('.plist').find('.qty').val();
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		var parameter = '';
		parameter += 'cartNum='+cartNum+'&productCode='+productCode+'&qty='+qty;
		location.href='../cart/updateCart.do?'+parameter;
	});
	$('.plus').click(function(){
		var productCode = $(this).parents('.plist').attr('id');
		var qty = Number($(this).parents('.plist').find('.qty').val()) + 1;
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		var parameter = '';
		parameter += 'cartNum='+cartNum+'&productCode='+productCode+'&qty='+qty;
		location.href='../cart/updateCart.do?'+parameter;
	});
	$('.minus').click(function(){
		var productCode = $(this).parents('.plist').attr('id');
		var qty = Number($(this).parents('.plist').find('.qty').val()) - 1;
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		var parameter = '';
		parameter += 'cartNum='+cartNum+'&productCode='+productCode+'&qty='+qty;
		location.href='../cart/updateCart.do?'+parameter;
	});
	//// 상품 하나 삭제버튼
	$('.delete').click(function(){
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		location.href='../cart/deleteCart.do?cartNum='+cartNum;
	});
	//// 상품 하나 주문버튼
	$('.order').click(function(){
		var cartNum = Number($(this).parents('.plist').find('.chk').val());
		location.href='../order/orderCart.do?cartNum='+cartNum;
	});
	//// 전체삭제 버튼
	$('.deleteAll').click(function(){
		location.href='../cart/deleteAll.do?memberId='+memberId;
	});
	// 전체주문 버튼
	$('.orderAll').click(function(){
		$('.chk').prop('checked',true);
		$('.selectOrder').click();
	});
	// 선택이 하나도 없을경우 서브밋 금지
	$('.selectForm').submit(function(){
		if($('.chk:checked').length < 1){
			alert('선택된 상품이 없습니다');
			return false;
		}
	});
	// 맨아래 주문하기버튼
	$('.lastorder').click(function(){
		$('.chk').prop('checked',true);
		$('.selectOrder').click();
	});
	