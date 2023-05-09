	
	/////////////////////////////////////////////// 초기변수세팅
	var orderCode = $('#orderCode').val();
	console.log('현재 주문번호는 '+orderCode);
	//var IMP = window.IMP; // 생략 가능
	IMP.init("imp70175521"); // 예: imp00000000a
	const patternName = /^[a-zA-Z가-힣]{1,}$/; // 이름 정규표현식 
	const patternTel = /^\d{2,3}[\-)]?\d{3,4}[\-]?\d{4}$/; // 전화번호 정규표현식
	var memberName = $('#memberName').val();
	var memberEmail = $('#memberEmail').val();
	var memberTel = $('#memberTel').val();
	var memberPost = $('#memberPost').val();
	var memberAddr = $('#memberAddr1').val();
	var totalPrice = $('#totalPrice').val();
	var discount = 0;
	
	// 쿠폰선택시 가격들 변동
	$('#couponList').change(function(){
		discount = Number($("#couponList option:selected").attr('id'));
		console.log(discount);
		$('.dis').text(discount.toLocaleString('ko-KR'));
		$('.tot').text((totalPrice-discount).toLocaleString('ko-KR'));
		
	});
	
	//////////////////////////////////////// 결제호출시 사용함수
	function requestPay(pg) {
	    IMP.request_pay({
	        //pg : 'html5_inicis.INIpayTest',
	        pg : pg,
	        pay_method : 'card',
	        merchant_uid: orderCode, 	//123123123-33004, 123123123-33003
	        name : 'bowow쇼핑몰',
	        amount : totalPrice-discount,
	        buyer_email : memberEmail,
	        buyer_name : memberName,
	        buyer_tel : memberTel,
	        buyer_addr : memberAddr,
	        buyer_postcode : memberPost
	    }, function (rsp) { // callback
	        //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	        console.log(rsp);
	        if(rsp.success){
	        	console.log('결제성공');
	        	var msg = '결제가 완료되었습니다.';
	        	msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
	            var input = $("<input>").attr("type", "hidden").attr("name", "totalPrice").val(totalPrice-discount);
				$('.orderForm').append($(input));
	            $(".orderForm").submit();
		        
		        
	        }else{
	        	console.log('결제실패');
	        	var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
	        }
	        console.log(msg);
	    });
	}
	
	///////////// 결제버튼 눌렀을경우  1.사용자 입력을 다 받았는지 체크  2. 결제처리   3. 결제성공시 submit
	function cash(pgr){
		console.log('1');
		var sub = true;
		var orderName  = $('#orderName').val();
		var orderPost  = $('#sample6_postcode').val();
		var orderAddr1 = $('#sample6_address').val();
		var orderAddr2 = $('#sample6_detailAddress').val();
		var orderTel   = $('#orderTel').val();
		console.log('2');
		if(orderName.search(/\s/)!=-1){
			alert('이름에 공백을 입력하지 마세요');
			sub = false;
			console.log('3');
		}else if(!orderName.match(patternName)){
			alert('이름을 제대로 입력해주세요');
			sub = false;
			console.log('4');
		}else if(!orderPost.trim() || orderPost.length < 2){
			alert('우편번호를 입력해주세요');
			sub = false;
			console.log('15');
		}else if(!orderAddr1.trim() || orderAddr1.length < 2){
			alert('기본주소를 입력해주세요');
			sub = false;
			console.log('16');
		}else if(!orderAddr2.trim() || orderAddr2.length < 2){
			alert('상세주소를 입력해주세요');
			sub = false;
			console.log('17');
		}else if(!orderTel.match(patternTel)){
			alert('전화번호를 제대로 입력해주세요');
			sub = false;
			console.log('18');
		}else if(!$('.terms').prop('checked')){
			alert('약관에 체크하세요');
			sub = false;
			console.log('19');
		}
		console.log('20');
		if(sub){
			requestPay(pgr);
			console.log('21');
		}
		console.log('22');
	};
	
	// 이미지나 상품명 누르면 상품상세보기로 이동
	$('.titleImg').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '../product/content.do?productCode='+productCode;
	});
	$('.title').click(function(){
		var productCode = $(this).parents('tr').attr('id');
		location.href = '../product/content.do?productCode='+productCode;
	});
	
	// 결제방식 선택시 div 바뀌는 부분
	$('.kakao').click(function(){
		$('.desc').html('카카오를 선택하셨네요.<br>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.');
		$('.paybutton').html('<div class="ppp" onclick="cash(\'kakaopay.TC0ONETIME\')">결제하기</div>');
	});
	$('.inipay').click(function(){
		$('.desc').html('ini를 선택하셨네요.<br>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.');
		$('.paybutton').html('<div class="ppp" onclick="cash(\'html5_inicis.INIpayTest\')">결제하기</div>');
	});
	$('.kcp').click(function(){
		$('.desc').html('kcp를 선택하셨네요.<br>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.');
		$('.paybutton').html('<div class="ppp" onclick="cash(\'kcp.T0000\')">결제하기</div>');
	});
	$('.toss').click(function(){
		$('.desc').html('toss를 선택하셨네요.<br>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.');
		$('.paybutton').html('<div class="ppp" onclick="cash(\'tosspay.tosstest\')">결제하기</div>');
	});
	$('.test').click(function(){
		$('.desc').html('test를 선택하셨네요.<br>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.');
		$('.paybutton').html('<div class="ppp" onclick="testsubmit()">결제하기</div>');
	});
	
	// 테스트 급하게 서브밋
	function testsubmit(){
		var input = $("<input>").attr("type", "hidden").attr("name", "totalPrice").val(totalPrice-discount);
		$('.orderForm').append($(input));
		$('.orderForm').submit();
	};
		
	