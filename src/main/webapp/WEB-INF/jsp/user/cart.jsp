<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div id="cartWrap">
	<div class="cart-header">
		<img src="/static/images/cart_page.gif" alt="��ٱ���">
	</div>
	<div class="cart-body">
		<div>
			<img src="/static/images/cart_fill.gif" alt="��ٱ���2">
		</div>
		<div class="table-cart">
			<table>
				<colgroup>
					<col width="60">
					<col width="80">
					<col width="500">
					<col width="80">
					<col width="90">
					<col width="90">
					<col width="90">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><div class="tb-center">��ȣ</div></th>
						<th scope="col"><div class="tb-center">����</div></th>
						<th scope="col"><div class="tb-center">��ǰ��</div></th>
						<th scope="col"><div class="tb-center">����</div></th>
						<th scope="col"><div class="tb-right">����</div></th>
						<th scope="col"><div class="tb-center">��ۺ�</div></th>
						<th scope="col"><div class="tb-center">���</div></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="8">
							<div class="tb-right">
								�� ���űݾ� : <span class="MK_none_groupsale_total_price_sell"><span
									class="MK_chg_none_groupsale_total_price_sell MK_change_price">29,300</span></span>��
								<span class="MK_total_vat"></span> <span
									class="MK_total_delivery"> + ��۷� <span
									class="MK_chg_total_delivery MK_change_price">2,500</span>��
								</span> <span class="MK_total_delivery_add"> + �߰���۷� <span
									class="MK_chg_total_delivery_add MK_change_price">0</span>��
								</span> <span class="MK_group_sale_price"></span> = <strong><span
									class="MK_total_price"><span
										class="MK_chg_total_price MK_change_price">31,800</span></span>��</strong> <span
									class="MK_total_reserve"></span>
							</div>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td><div class="tb-center">1</div></td>
						<td>
							<div class="tb-center">
								<div class="thumb">
									<a
										href="/shop/shopdetail.html?branduid=1255514&amp;xcode=001&amp;mcode=&amp;scode=&amp;GfDT=bmp8W1w%3D"><img
										src="/shopimages/cooltrack/0010100004813.jpg?1545983962"
										alt="��ǰ ������" title="��ǰ ������"></a>
								</div>
							</div>
						</td>
						<td>
							<div class="tb-left">
								<a
									href="/shop/shopdetail.html?branduid=1255514&amp;xcode=001&amp;mcode=&amp;scode=&amp;GfDT=bmp8W1w%3D">�����
									- Memory </a> <span class="MK-product-icons"></span>
							</div>
						</td>
						<td>
							<div class="tb-center">
								<div class="opt-spin">
									<input type="text" name="amount" value="1" class="txt-spin"
										onchange="realtime_quantity_ctrl('set_amount',0,'upd',0, ''); "
										onkeypress="quantity_ctrl_enter();"> <span
										class="btns"> <a
										href="javascript:realtime_quantity_ctrl('up', 0, 'upd', 0, '')"><img
											class="btn-up" src="/images/common/basket_up.gif"></a> <a
										href="javascript:realtime_quantity_ctrl('down', 0, 'upd', 0, '')"><img
											class="btn-dw" src="/images/common/basket_down.gif"></a>
									</span>
								</div>
							</div>
						</td>
						<td><div class="tb-right tb-bold tb-price">
								<span><span class="MK_price_sell1255514_1">11,500</span></span>��
							</div></td>
						<td><div class="tb-center tb-delivery">
								<div class="MS_tb_delivery">
									<span class="MS_deli_txt" onmouseover="overcase(this, '0')"
										onmouseout="outcase(this, '0')"> <span
										class="MS_deli_title MS_deli_block">[�⺻���]</span><span
										class="MS_deli_desc MS_deli_block">����</span>
									</span>
									<div id="deliverycase0" class="MS_layer_delivery"
										style="display: none;">
										<dl>
											<dt>������� : �⺻���(����)</dt>
											<dd>
												�ֹ��ݾ׿� ���� ��ۺ� <br> <span class="MS_highlight">����������
													û���˴ϴ�.</span>
											</dd>
										</dl>
										<span class="bull"></span>
										<iframe id="deliverycase_iframe0"
											class="MS_layer_delivery_iframe" frameborder="no" border="0"></iframe>
									</div>
								</div>
							</div></td>
						<td>
							<div class="tb-center">
								<span class="d-block"><a
									href="javascript:basket_wish_login();"><img
										src="/images/d3/modern_simple/btn/btn_h19_wish_prd.gif"
										alt="���ɻ�ǰ" title="���ɻ�ǰ"></a></span> <span class="d-block"><a
									href="javascript:send_basket(0, 'del')"><img
										src="/images/d3/modern_simple/btn/btn_h19_del.gif" alt="����"
										title="����"></a></span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="delivery">
		<span class="MK_delivery_message">��� �ֹ��� ��۷� <span
			class="MK_chg_delivery_message">2,500</span>���� û���մϴ�.
		</span>
	</div>
</div>