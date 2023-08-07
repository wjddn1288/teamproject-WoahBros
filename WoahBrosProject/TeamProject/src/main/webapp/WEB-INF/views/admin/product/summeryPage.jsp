<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="/resources/admin/ass/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin
	Template - Pro</title>

<!-- header_link -->
<%@include file="../inc/header_link.jsp"%>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<%@include file="../inc/menu.jsp"%>

			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page m-5">


				<!-- Content wrapper -->
				<div class="container">
					<div class="row">

						<div class="card h-100">
							<div
								class="card-header d-flex align-items-center justify-content-between pb-0">
								<div class="card-title mb-0">
									<h5 class="m-0 me-2">Order Statistics</h5>
									<small class="text-muted">42.82k Total Sales</small>
								</div>
								<div class="dropdown">
									<button class="btn p-0" type="button" id="orederStatistics"
										data-bs-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="bx bx-dots-vertical-rounded"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-end"
										aria-labelledby="orederStatistics">
										<a class="dropdown-item" href="javascript:void(0);">Select
											All</a> <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
										<a class="dropdown-item" href="javascript:void(0);">Share</a>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div
									class="d-flex justify-content-between align-items-center mb-3"
									style="position: relative;">
									<div class="d-flex flex-column align-items-center gap-1">
										<h2 class="mb-2">8,258</h2>
										<span>Total Orders</span>
									</div>
									<div id="orderStatisticsChart" style="min-height: 137.55px;">
										<div id="apexcharts7brx1xlc"
											class="apexcharts-canvas apexcharts7brx1xlc apexcharts-theme-light"
											style="width: 130px; height: 137.55px;">
											<svg id="SvgjsSvg2503" width="130" height="137.55"
												xmlns="http://www.w3.org/2000/svg" version="1.1"
												xmlns:xlink="http://www.w3.org/1999/xlink"
												xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg"
												xmlns:data="ApexChartsNS" transform="translate(0, 0)"
												style="background: transparent;">
												<g id="SvgjsG2505"
													class="apexcharts-inner apexcharts-graphical"
													transform="translate(-7, 0)">
												<defs id="SvgjsDefs2504">
												<clipPath id="gridRectMask7brx1xlc">
												<rect id="SvgjsRect2507" width="150" height="173" x="-4.5"
													y="-2.5" rx="0" ry="0" opacity="1" stroke-width="0"
													stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath>
												<clipPath id="forecastMask7brx1xlc"></clipPath>
												<clipPath id="nonForecastMask7brx1xlc"></clipPath>
												<clipPath id="gridRectMarkerMask7brx1xlc">
												<rect id="SvgjsRect2508" width="145" height="172" x="-2"
													y="-2" rx="0" ry="0" opacity="1" stroke-width="0"
													stroke="none" stroke-dasharray="0" fill="#fff"></rect></clipPath></defs>
												<g id="SvgjsG2509" class="apexcharts-pie">
												<g id="SvgjsG2510" transform="translate(0, 0) scale(1)">
												<circle id="SvgjsCircle2511" r="44.835365853658544"
													cx="70.5" cy="70.5" fill="transparent"></circle>
												<g id="SvgjsG2512" class="apexcharts-slices">
												<g id="SvgjsG2513"
													class="apexcharts-series apexcharts-pie-series"
													seriesName="Electronic" rel="1" data:realIndex="0">
												<path id="SvgjsPath2514"
													d="M 70.5 10.71951219512195 A 59.78048780487805 59.78048780487805 0 0 1 97.63977353321047 123.7648046533095 L 90.85483014990785 110.44860348998213 A 44.835365853658544 44.835365853658544 0 0 0 70.5 25.664634146341456 L 70.5 10.71951219512195 z"
													fill="rgba(105,108,255,1)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="5"
													stroke-dasharray="0"
													class="apexcharts-pie-area apexcharts-donut-slice-0"
													index="0" j="0" data:angle="153" data:startAngle="0"
													data:strokeWidth="5" data:value="85"
													data:pathOrig="M 70.5 10.71951219512195 A 59.78048780487805 59.78048780487805 0 0 1 97.63977353321047 123.7648046533095 L 90.85483014990785 110.44860348998213 A 44.835365853658544 44.835365853658544 0 0 0 70.5 25.664634146341456 L 70.5 10.71951219512195 z"
													stroke="#ffffff"></path></g>
												<g id="SvgjsG2515"
													class="apexcharts-series apexcharts-pie-series"
													seriesName="Sports" rel="2" data:realIndex="1">
												<path id="SvgjsPath2516"
													d="M 97.63977353321047 123.7648046533095 A 59.78048780487805 59.78048780487805 0 0 1 70.5 130.28048780487805 L 70.5 115.33536585365854 A 44.835365853658544 44.835365853658544 0 0 0 90.85483014990785 110.44860348998213 L 97.63977353321047 123.7648046533095 z"
													fill="rgba(133,146,163,1)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="5"
													stroke-dasharray="0"
													class="apexcharts-pie-area apexcharts-donut-slice-1"
													index="0" j="1" data:angle="27" data:startAngle="153"
													data:strokeWidth="5" data:value="15"
													data:pathOrig="M 97.63977353321047 123.7648046533095 A 59.78048780487805 59.78048780487805 0 0 1 70.5 130.28048780487805 L 70.5 115.33536585365854 A 44.835365853658544 44.835365853658544 0 0 0 90.85483014990785 110.44860348998213 L 97.63977353321047 123.7648046533095 z"
													stroke="#ffffff"></path></g>
												<g id="SvgjsG2517"
													class="apexcharts-series apexcharts-pie-series"
													seriesName="Decor" rel="3" data:realIndex="2">
												<path id="SvgjsPath2518"
													d="M 70.5 130.28048780487805 A 59.78048780487805 59.78048780487805 0 0 1 10.71951219512195 70.50000000000001 L 25.664634146341456 70.5 A 44.835365853658544 44.835365853658544 0 0 0 70.5 115.33536585365854 L 70.5 130.28048780487805 z"
													fill="rgba(3,195,236,1)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="5"
													stroke-dasharray="0"
													class="apexcharts-pie-area apexcharts-donut-slice-2"
													index="0" j="2" data:angle="90" data:startAngle="180"
													data:strokeWidth="5" data:value="50"
													data:pathOrig="M 70.5 130.28048780487805 A 59.78048780487805 59.78048780487805 0 0 1 10.71951219512195 70.50000000000001 L 25.664634146341456 70.5 A 44.835365853658544 44.835365853658544 0 0 0 70.5 115.33536585365854 L 70.5 130.28048780487805 z"
													stroke="#ffffff"></path></g>
												<g id="SvgjsG2519"
													class="apexcharts-series apexcharts-pie-series"
													seriesName="Fashion" rel="4" data:realIndex="3">
												<path id="SvgjsPath2520"
													d="M 10.71951219512195 70.50000000000001 A 59.78048780487805 59.78048780487805 0 0 1 70.48956633664653 10.719513105630845 L 70.4921747524849 25.664634829223125 A 44.835365853658544 44.835365853658544 0 0 0 25.664634146341456 70.5 L 10.71951219512195 70.50000000000001 z"
													fill="rgba(113,221,55,1)" fill-opacity="1"
													stroke-opacity="1" stroke-linecap="butt" stroke-width="5"
													stroke-dasharray="0"
													class="apexcharts-pie-area apexcharts-donut-slice-3"
													index="0" j="3" data:angle="90" data:startAngle="270"
													data:strokeWidth="5" data:value="50"
													data:pathOrig="M 10.71951219512195 70.50000000000001 A 59.78048780487805 59.78048780487805 0 0 1 70.48956633664653 10.719513105630845 L 70.4921747524849 25.664634829223125 A 44.835365853658544 44.835365853658544 0 0 0 25.664634146341456 70.5 L 10.71951219512195 70.50000000000001 z"
													stroke="#ffffff"></path></g></g></g>
												<g id="SvgjsG2521" class="apexcharts-datalabels-group"
													transform="translate(0, 0) scale(1)">
												<text id="SvgjsText2522"
													font-family="Helvetica, Arial, sans-serif" x="70.5"
													y="90.5" text-anchor="middle" dominant-baseline="auto"
													font-size="0.8125rem" font-weight="400" fill="#a1acb8"
													class="apexcharts-text apexcharts-datalabel-label"
													style="font-family: Helvetica, Arial, sans-serif;">Weekly</text>
												<text id="SvgjsText2523" font-family="Public Sans" x="70.5"
													y="71.5" text-anchor="middle" dominant-baseline="auto"
													font-size="1.5rem" font-weight="400" fill="#566a7f"
													class="apexcharts-text apexcharts-datalabel-value"
													style="font-family: &quot;Public Sans&quot;;">38%</text></g></g>
												<line id="SvgjsLine2524" x1="0" y1="0" x2="141" y2="0"
													stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
													stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
												<line id="SvgjsLine2525" x1="0" y1="0" x2="141" y2="0"
													stroke-dasharray="0" stroke-width="0" stroke-linecap="butt"
													class="apexcharts-ycrosshairs-hidden"></line></g>
												<g id="SvgjsG2506" class="apexcharts-annotations"></g></svg>
											<div class="apexcharts-legend"></div>
											<div class="apexcharts-tooltip apexcharts-theme-dark">
												<div class="apexcharts-tooltip-series-group"
													style="order: 1;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(105, 108, 255);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
												<div class="apexcharts-tooltip-series-group"
													style="order: 2;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(133, 146, 163);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
												<div class="apexcharts-tooltip-series-group"
													style="order: 3;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(3, 195, 236);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
												<div class="apexcharts-tooltip-series-group"
													style="order: 4;">
													<span class="apexcharts-tooltip-marker"
														style="background-color: rgb(113, 221, 55);"></span>
													<div class="apexcharts-tooltip-text"
														style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
														<div class="apexcharts-tooltip-y-group">
															<span class="apexcharts-tooltip-text-y-label"></span><span
																class="apexcharts-tooltip-text-y-value"></span>
														</div>
														<div class="apexcharts-tooltip-goals-group">
															<span class="apexcharts-tooltip-text-goals-label"></span><span
																class="apexcharts-tooltip-text-goals-value"></span>
														</div>
														<div class="apexcharts-tooltip-z-group">
															<span class="apexcharts-tooltip-text-z-label"></span><span
																class="apexcharts-tooltip-text-z-value"></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="resize-triggers">
										<div class="expand-trigger">
											<div style="width: 254px; height: 139px;"></div>
										</div>
										<div class="contract-trigger"></div>
									</div>
								</div>
								<ul class="p-0 m-0">
									<li class="d-flex mb-4 pb-1">
										<div class="avatar flex-shrink-0 me-3">
											<span class="avatar-initial rounded bg-label-primary"><i
												class="bx bx-mobile-alt"></i></span>
										</div>
										<div
											class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
											<div class="me-2">
												<h6 class="mb-0">Electronic</h6>
												<small class="text-muted">Mobile, Earbuds, TV</small>
											</div>
											<div class="user-progress">
												<small class="fw-semibold">82.5k</small>
											</div>
										</div>
									</li>
									<li class="d-flex mb-4 pb-1">
										<div class="avatar flex-shrink-0 me-3">
											<span class="avatar-initial rounded bg-label-success"><i
												class="bx bx-closet"></i></span>
										</div>
										<div
											class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
											<div class="me-2">
												<h6 class="mb-0">Fashion</h6>
												<small class="text-muted">T-shirt, Jeans, Shoes</small>
											</div>
											<div class="user-progress">
												<small class="fw-semibold">23.8k</small>
											</div>
										</div>
									</li>
									<li class="d-flex mb-4 pb-1">
										<div class="avatar flex-shrink-0 me-3">
											<span class="avatar-initial rounded bg-label-info"><i
												class="bx bx-home-alt"></i></span>
										</div>
										<div
											class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
											<div class="me-2">
												<h6 class="mb-0">Decor</h6>
												<small class="text-muted">Fine Art, Dining</small>
											</div>
											<div class="user-progress">
												<small class="fw-semibold">849k</small>
											</div>
										</div>
									</li>
									<li class="d-flex">
										<div class="avatar flex-shrink-0 me-3">
											<span class="avatar-initial rounded bg-label-secondary"><i
												class="bx bx-football"></i></span>
										</div>
										<div
											class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
											<div class="me-2">
												<h6 class="mb-0">Sports</h6>
												<small class="text-muted">Football, Cricket Kit</small>
											</div>
											<div class="user-progress">
												<small class="fw-semibold">99</small>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

					</div>
				</div>
				<!-- / Content -->

				<!-- Content wrapper -->


				<!-- Footer -->
				<%@include file="../inc/footer.jsp"%>
				<!-- / Footer -->

				<div class="content-backdrop fade"></div>
			</div>
			<!-- Content wrapper -->
		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<%@include file="../inc/footer_link.jsp"%>
</body>
</html>
