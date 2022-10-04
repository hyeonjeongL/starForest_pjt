function FavoriteHtmlContents(){
}
FavoriteHtmlContents.favorite_list_content=function(){
	return `
<div class="entry-content">
	
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-9">

					<div class="items-header directory-header d-flex justify-content-lg-between align-items-baseline">
						<h4 class="selected-dir-name">전체</h4>
						<div class="item-count">
							<span class="number">2</span>건						</div>
					</div><!-- .items-header -->
					
					<div class="e-items list">
						
						<div class="e-item item-headings d-none d-xl-flex align-items-center">
							<div class="item-index">번호</div>
							<div class="item-data">자료</div>
							<div class="item-date">등록일</div>
							<div class="item-functions">작업</div>
						</div><!-- .item-headings -->

												
						<div class="e-item d-md-flex align-items-center">
							<div class="item-index">1</div>
							<div class="item item-data d-flex">
								<div class="item-cover">
									<a href="/detail/?cid=CAT000000949038&ctype=m">
																													<div class="item-cover-image" style="background-image:url(/n2app/public/coverimage.php?sysd=CAT&control_no=000000949038)"></div>
																		</a>
								</div>
								<div class="item-meta">
									<div class="item-type">
										단행본																			</div>
									<div class="item-title">
										<h4><a href="/detail/?cid=CAT000000949038&ctype=m">자바를 자바라 (48회 대출)</a></h4>
									</div>
									<div class="item-author">신정호</div>
									<div class="item-pub">미래정보사 (1996)</div>
								</div>								
							</div>
							<div class="item-date"><span class="d-inline d-lg-none">등록일 </span>2022-10-04</div>
							<div class="item-functions">
								<a role="button" class="btn btn-sm btn-primary item-delete-trigger" item-val="234279">삭제</a>
								<a role="button" class="btn btn-sm btn-primary set-item-val" item-val="234279" data-toggle="modal" data-target="#directory-select">이동</a>
							</div>
						</div><!-- item : 1 -->

												
					</div><!-- .e-items.list -->
			
				</div><!-- .col -->
			</div><!-- .row -->

		</div><!-- .container -->
	</div><!-- .content -->
	
</div><!-- .entry-content -->
`;
	
}






