function BookClubHtmlContents(){
}
BookClubHtmlContents.club_item_html=function(club){
	return `
							<div class="rentalTable">
									<table class="table" style="width: 750px">
										<thead style="border: 1px solid #dee2e6">
											<tr>
												<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;font-weight:bold"><font size="4">${club.club_no}
												</font></td>
												<td colspan="1" style="padding:0px;text-align:left;padding-left: 30px;font-weight:bold"><font size="4">${club.club_name}
												</td>
												<td colspan="4" style="padding:10px;text-align:right;padding-right: 30px;font-weight:bold"><font size="4">조회 ${club.club_readcount}
												</td>
												
												
											</tr>
										</thead>
										<tbody>
											<tr id="rental_item_"
												style="border: 1px solid #dee2e6; height: 250px;">
					
												<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px"><img src="./img/club.png" width=100 height=100>
												</td>
												<td colspan="2" style="padding:0px;text-align:left;padding-left: 30px">대상 : ${club.club_person} <br> 모집인원 : ${club.club_count} <br> 시간 : ${club.club_time} <br> 장소 : ${club.club_place}
												</td>
												<td colspan="2" style="padding:0px;text-align:center;padding-left: 0px">
												
												<button id="btn_detail" class="w-btn w-btn-detail" type="button">자세히</button><br>
												<button id="btn_join" class="w-btn w-btn-join" type="button">신&nbsp;&nbsp;&nbsp;청</button>
								
													
					
					
											</tr>
											<tr id="rental_item_"></tr>
										</tbody>
									</table>
									
								</div>`;
}
BookClubHtmlContents.club_join_html=function(bookClubArray){
	return `
							<select style="width: 170px;margin-bottom: 50px;border:2px solid #dee2e6">
								<option value="category">전체</option>
								<option value="category">100 건강/취미/레저</option>
								<option value="category">200 경제경영</option>
								<option value="category">300 고전</option>
								<option value="category">400 과학</option>
								<option value="category">500 만화</option>
								<option value="category">600 사회과학</option>
								<option value="category">700 소설/시/희곡</option>
							</select>
									
								<div class="rentalTable">
									${
										bookClubArray.map(BookClubHtmlContents.club_item_html).join('')
									  }
								</div>
									
							`;
}
BookClubHtmlContents.club_detail_html=function(){
	return `<div class="col-6">
										<div class="row"><br></div>
										<div class="row">
										<br> 
										<br> 
										<!-- 나의도서정보(대여리스트) -->
											<div class="rentalTable">
												<table class="table" style="width: 855px">
													
													<tbody>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7 ">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">대상
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															소설에관심이 많은 성인분들
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">대상
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															소설에관심이 많은 성인분들
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">대상
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															소설에관심이 많은 성인분들
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 50px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">대상
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															소설에관심이 많은 성인분들
															</td>
															
								
								
														</tr>
														<tr id="rental_item_"
															style="border: 1px solid #dee2e6; height: 130px;">
								
															<td colspan="1" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7">
															</td>
															<td colspan="2" style="padding:0px;text-align:left;padding-left: 20px;background-color: #eff3f7;font-weight: bold">내용
															</td>
															<td colspan="2" style="padding:0px;text-align:middle;padding-left: 20px">
															소설에<br>관심이<br> 많은 성인분들
															</td>
															
								
								
														</tr>
														<tr 
															style=" height: 130px;">
								
															<td colspan="5" >
																<button id="club_join_btn" style="padding: 10px 30px 10px 30px;cursor: pointer;border-color:#dee2e6">신&nbsp;&nbsp;&nbsp;청</button>
															</td>
															
															
								
								
														</tr>
														
													</tbody>
												</table>
											</div>
											<!---->
										</div>
								
									</div>`;
}
