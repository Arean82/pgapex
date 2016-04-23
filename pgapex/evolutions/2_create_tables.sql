CREATE TABLE report_column (
	heading VARCHAR ( 255 ) NOT NULL,
	sequence INTEGER NOT NULL,
	is_text_escaped SMALLINT NOT NULL,
	report_column_ID INTEGER NOT NULL,
	report_column_type_ID INTEGER NOT NULL,
	region_ID INTEGER NOT NULL,
	column_ID INTEGER,
	CONSTRAINT PK_report_column98 PRIMARY KEY (report_column_ID)
	);
CREATE INDEX TC_report_column291 ON report_column (region_ID );
CREATE INDEX TC_report_column366 ON report_column (column_ID );
CREATE INDEX TC_report_column290 ON report_column (report_column_type_ID );
CREATE TABLE report_column_link (
	url VARCHAR ( 255 ) NOT NULL,
	attributes VARCHAR ( 255 ) NOT NULL,
	link_text VARCHAR ( 255 ) NOT NULL,
	report_column_link_ID INTEGER NOT NULL,
	report_column_ID INTEGER NOT NULL,
	CONSTRAINT TC_report_column_link268 UNIQUE (report_column_ID),
	CONSTRAINT PK_report_column_link104 PRIMARY KEY (report_column_link_ID)
	);
CREATE INDEX TC_report_column_link298 ON report_column_link (report_column_ID );
CREATE TABLE report_column_type (
	report_column_type VARCHAR ( 255 ) NOT NULL,
	report_column_type_ID INTEGER NOT NULL,
	CONSTRAINT PK_report_column_type103 PRIMARY KEY (report_column_type_ID)
	);
CREATE TABLE display_point (
	name VARCHAR ( 255 ) NOT NULL,
	display_point_ID INTEGER NOT NULL,
	CONSTRAINT PK_display_point80 PRIMARY KEY (display_point_ID)
	);
CREATE TABLE authentication_scheme (
	authentication_scheme SMALLINT NOT NULL,
	authentication_scheme_ID INTEGER NOT NULL,
	CONSTRAINT PK_authentication_scheme67 PRIMARY KEY (authentication_scheme_ID)
	);
CREATE TABLE textarea_template (
	template VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_textarea_template87 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_textarea_template252 ON textarea_template (template_ID );
CREATE TABLE button_template (
	template VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_button_template88 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_button_template253 ON button_template (template_ID );
CREATE TABLE navigation (
	name VARCHAR ( 255 ) NOT NULL,
	navigation_ID INTEGER NOT NULL,
	application_ID INTEGER NOT NULL,
	CONSTRAINT PK_navigation112 PRIMARY KEY (navigation_ID)
	);
CREATE INDEX TC_navigation379 ON navigation (application_ID );
CREATE TABLE input_template (
	template VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_input_template85 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_input_template250 ON input_template (template_ID );
CREATE TABLE page_template (
	header VARCHAR ( 255 ) NOT NULL,
	body VARCHAR ( 255 ) NOT NULL,
	footer VARCHAR ( 255 ) NOT NULL,
	error_message VARCHAR ( 255 ) NOT NULL,
	success_message VARCHAR ( 255 ) NOT NULL,
	page_type_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_page_template90 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_page_template255 ON page_template (template_ID );
CREATE INDEX TC_page_template256 ON page_template (page_type_ID );
CREATE TABLE function (
	name VARCHAR ( 255 ) NOT NULL,
	function_ID INTEGER NOT NULL,
	schema_ID INTEGER NOT NULL,
	data_type_ID INTEGER,
	CONSTRAINT PK_function116 PRIMARY KEY (function_ID)
	);
CREATE INDEX TC_function328 ON function (schema_ID );
CREATE INDEX TC_function329 ON function (data_type_ID );
CREATE TABLE navigation_item (
	name VARCHAR ( 255 ) NOT NULL,
	sequence INTEGER NOT NULL,
	navigation_item_ID INTEGER NOT NULL,
	navigation_ID INTEGER NOT NULL,
	navigation_item_navigation_item_ID INTEGER,
	page_ID INTEGER,
	CONSTRAINT PK_navigation_item113 PRIMARY KEY (navigation_item_ID)
	);
CREATE INDEX TC_navigation_item305 ON navigation_item (navigation_ID );
CREATE INDEX TC_navigation_item304 ON navigation_item (navigation_item_navigation_item_ID );
CREATE INDEX TC_navigation_item380 ON navigation_item (page_ID );
CREATE TABLE page_item (
	name VARCHAR ( 255 ) NOT NULL,
	page_item_ID INTEGER NOT NULL,
	page_ID INTEGER NOT NULL,
	form_field_ID INTEGER,
	region_ID INTEGER NOT NULL,
	CONSTRAINT PK_page_item93 PRIMARY KEY (page_item_ID),
	CONSTRAINT TC_page_item270 UNIQUE (form_field_ID)
	);
CREATE INDEX TC_page_item262 ON page_item (page_ID );
CREATE INDEX TC_page_item357 ON page_item (region_ID );
CREATE INDEX TC_page_item356 ON page_item (form_field_ID );
CREATE TABLE view_column (
	name VARCHAR ( 255 ) NOT NULL,
	column_ID INTEGER NOT NULL,
	data_type_ID INTEGER NOT NULL,
	view_ID INTEGER NOT NULL,
	CONSTRAINT PK_column120 PRIMARY KEY (column_ID)
	);
CREATE INDEX TC_column335 ON view_column (data_type_ID );
CREATE INDEX TC_column334 ON view_column (view_ID );
CREATE TABLE view (
	name VARCHAR ( 255 ) NOT NULL,
	view_ID INTEGER NOT NULL,
	schema_ID INTEGER NOT NULL,
	CONSTRAINT PK_view119 PRIMARY KEY (view_ID)
	);
CREATE INDEX TC_view333 ON view (schema_ID );
CREATE TABLE navigation_template (
	navigation_begin VARCHAR ( 255 ) NOT NULL,
	navigation_end VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_navigation_template89 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_navigation_template254 ON navigation_template (template_ID );
CREATE TABLE form_pre_fill (
	form_pre_fill_ID INTEGER NOT NULL,
	view_ID INTEGER NOT NULL,
	CONSTRAINT PK_form_pre_fill106 PRIMARY KEY (form_pre_fill_ID)
	);
CREATE INDEX TC_form_pre_fill378 ON form_pre_fill (view_ID );
CREATE TABLE session (
	data VARCHAR ( 255 ) NOT NULL,
	expiration_time VARCHAR ( 255 ) NOT NULL,
	session_ID INTEGER NOT NULL,
	application_ID INTEGER NOT NULL,
	CONSTRAINT PK_session68 PRIMARY KEY (session_ID)
	);
CREATE INDEX TC_session230 ON session (application_ID );
CREATE TABLE application (
	alias VARCHAR ( 255 ) NOT NULL,
	name VARCHAR ( 255 ) NOT NULL,
	database_username VARCHAR ( 255 ) NOT NULL,
	databse_password VARCHAR ( 255 ) NOT NULL,
	application_ID INTEGER NOT NULL,
	authentication_scheme_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	function_ID INTEGER,
	database_ID INTEGER NOT NULL,
	CONSTRAINT PK_application66 PRIMARY KEY (application_ID)
	);
CREATE INDEX TC_application352 ON application (database_ID );
CREATE INDEX TC_application229 ON application (authentication_scheme_ID );
CREATE INDEX TC_application351 ON application (template_ID );
CREATE INDEX TC_application353 ON application (function_ID );
CREATE TABLE form_field (
	label VARCHAR ( 255 ) NOT NULL,
	sequence INTEGER NOT NULL,
	is_mandatory SMALLINT NOT NULL,
	is_visible SMALLINT NOT NULL,
	default_value VARCHAR ( 255 ) NOT NULL,
	help_text VARCHAR ( 255 ) NOT NULL,
	form_field_ID INTEGER NOT NULL,
	field_type_ID INTEGER NOT NULL,
	list_of_values_ID INTEGER,
	form_pre_fill_ID INTEGER NOT NULL,
	parameter_ID INTEGER NOT NULL,
	column_ID INTEGER,
	template_ID INTEGER,
	drop_down_template_template_ID INTEGER,
	textarea_template_template_ID INTEGER,
	CONSTRAINT TC_form_field274 UNIQUE (list_of_values_ID),
	CONSTRAINT PK_form_field99 PRIMARY KEY (form_field_ID)
	);
CREATE INDEX TC_form_field371 ON form_field (template_ID );
CREATE INDEX TC_form_field367 ON form_field (parameter_ID );
CREATE INDEX TC_form_field369 ON form_field (textarea_template_template_ID );
CREATE INDEX TC_form_field370 ON form_field (drop_down_template_template_ID );
CREATE INDEX TC_form_field294 ON form_field (list_of_values_ID );
CREATE INDEX TC_form_field293 ON form_field (field_type_ID );
CREATE INDEX TC_form_field368 ON form_field (column_ID );
CREATE INDEX TC_form_field292 ON form_field (form_pre_fill_ID );
CREATE TABLE form_region (
	button_label VARCHAR ( 255 ) NOT NULL,
	success_message VARCHAR ( 255 ) NOT NULL,
	error_message VARCHAR ( 255 ) NOT NULL,
	redirect_url VARCHAR ( 255 ) NOT NULL,
	form_pre_fill_ID INTEGER,
	region_ID INTEGER NOT NULL,
	function_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	button_template_template_ID INTEGER NOT NULL,
	CONSTRAINT TC_form_region276 UNIQUE (form_pre_fill_ID),
	CONSTRAINT PK_form_region110 PRIMARY KEY (region_ID)
	);
CREATE INDEX TC_form_region363 ON form_region (template_ID );
CREATE INDEX TC_form_region364 ON form_region (button_template_template_ID );
CREATE INDEX TC_form_region365 ON form_region (function_ID );
CREATE INDEX TC_form_region288 ON form_region (form_pre_fill_ID );
CREATE INDEX TC_form_region289 ON form_region (region_ID );
CREATE TABLE parameter (
	name VARCHAR ( 255 ) NOT NULL,
	ordinal_position INTEGER NOT NULL,
	parameter_ID INTEGER NOT NULL,
	function_ID INTEGER NOT NULL,
	data_type_ID INTEGER NOT NULL,
	CONSTRAINT PK_parameter117 PRIMARY KEY (parameter_ID)
	);
CREATE INDEX TC_parameter331 ON parameter (data_type_ID );
CREATE INDEX TC_parameter330 ON parameter (function_ID );
CREATE TABLE drop_down_template (
	drop_down_begin VARCHAR ( 255 ) NOT NULL,
	drop_down_end VARCHAR ( 255 ) NOT NULL,
	option_begin VARCHAR ( 255 ) NOT NULL,
	option_end VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_drop_down_template86 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_drop_down_template251 ON drop_down_template (template_ID );
CREATE TABLE page_type (
	page_type VARCHAR ( 255 ) NOT NULL,
	page_type_ID INTEGER NOT NULL,
	CONSTRAINT PK_page_type82 PRIMARY KEY (page_type_ID)
	);
CREATE TABLE report_region (
	items_per_page INTEGER NOT NULL,
	show_header SMALLINT NOT NULL,
	region_ID INTEGER NOT NULL,
	view_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_report_region109 PRIMARY KEY (region_ID)
	);
CREATE INDEX TC_report_region361 ON report_region (view_ID );
CREATE INDEX TC_report_region287 ON report_region (region_ID );
CREATE INDEX TC_report_region362 ON report_region (template_ID );
CREATE TABLE page_template_display_point (
	description VARCHAR ( 255 ) NOT NULL,
	page_template_display_point_ID INTEGER NOT NULL,
	display_point_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_page_template_display_po81 PRIMARY KEY (page_template_display_point_ID)
	);
CREATE INDEX TC_page_template_display_po259 ON page_template_display_point (display_point_ID );
CREATE INDEX TC_page_template_display_po260 ON page_template_display_point (template_ID );
CREATE TABLE url (
	url VARCHAR ( 255 ) NOT NULL,
	url_ID INTEGER NOT NULL,
	navigation_item_ID INTEGER NOT NULL,
	CONSTRAINT PK_url114 PRIMARY KEY (url_ID),
	CONSTRAINT TC_url303 UNIQUE (navigation_item_ID)
	);
CREATE INDEX TC_url306 ON url (navigation_item_ID );
CREATE TABLE template (
	name VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_template69 PRIMARY KEY (template_ID)
	);
CREATE TABLE fetch_row_condition (
	fetch_row_condition_ID INTEGER NOT NULL,
	form_pre_fill_ID INTEGER NOT NULL,
	column_ID INTEGER NOT NULL,
	page_item_ID INTEGER NOT NULL,
	CONSTRAINT PK_fetch_row_condition102 PRIMARY KEY (fetch_row_condition_ID)
	);
CREATE INDEX TC_fetch_row_condition297 ON fetch_row_condition (form_pre_fill_ID );
CREATE INDEX TC_fetch_row_condition375 ON fetch_row_condition (page_item_ID );
CREATE INDEX TC_fetch_row_condition374 ON fetch_row_condition (column_ID );
CREATE TABLE html_region (
	content VARCHAR ( 255 ) NOT NULL,
	region_ID INTEGER NOT NULL,
	CONSTRAINT PK_html_region108 PRIMARY KEY (region_ID)
	);
CREATE INDEX TC_html_region286 ON html_region (region_ID );
CREATE TABLE database (
	name VARCHAR ( 255 ) NOT NULL,
	database_ID INTEGER NOT NULL,
	CONSTRAINT PK_database121 PRIMARY KEY (database_ID)
	);
CREATE TABLE navigation_type (
	navigation_type VARCHAR ( 255 ) NOT NULL,
	navigation_type_ID INTEGER NOT NULL,
	CONSTRAINT PK_navigation_type107 PRIMARY KEY (navigation_type_ID)
	);
CREATE TABLE field_type (
	field_type VARCHAR ( 255 ) NOT NULL,
	field_type_ID INTEGER NOT NULL,
	CONSTRAINT PK_field_type101 PRIMARY KEY (field_type_ID)
	);
CREATE TABLE schema (
	name VARCHAR ( 255 ) NOT NULL,
	schema_ID INTEGER NOT NULL,
	database_ID INTEGER NOT NULL,
	CONSTRAINT PK_schema115 PRIMARY KEY (schema_ID)
	);
CREATE INDEX TC_schema327 ON schema (database_ID );
CREATE TABLE navigation_item_template (
	active_template VARCHAR ( 255 ) NOT NULL,
	inactive_template VARCHAR ( 255 ) NOT NULL,
	level INTEGER NOT NULL,
	navigation_item_template_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_navigation_item_template79 PRIMARY KEY (navigation_item_template_ID)
	);
CREATE INDEX TC_navigation_item_template258 ON navigation_item_template (template_ID );
CREATE TABLE form_template (
	form_begin VARCHAR ( 255 ) NOT NULL,
	form_end VARCHAR ( 255 ) NOT NULL,
	row_begin VARCHAR ( 255 ) NOT NULL,
	row_end VARCHAR ( 255 ) NOT NULL,
	row VARCHAR ( 255 ) NOT NULL,
	mandatory_row_begin VARCHAR ( 255 ) NOT NULL,
	mandatory_row_end VARCHAR ( 255 ) NOT NULL,
	mandatory_row VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_form_template83 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_form_template248 ON form_template (template_ID );
CREATE TABLE region (
	name VARCHAR ( 255 ) NOT NULL,
	sequence INTEGER NOT NULL,
	is_visible SMALLINT NOT NULL,
	region_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	page_template_display_point_ID INTEGER NOT NULL,
	page_ID INTEGER NOT NULL,
	CONSTRAINT PK_region94 PRIMARY KEY (region_ID)
	);
CREATE INDEX TC_region358 ON region (template_ID );
CREATE INDEX TC_region360 ON region (page_template_display_point_ID );
CREATE INDEX TC_region359 ON region (page_ID );
CREATE TABLE region_template (
	template SMALLINT NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_region_template91 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_region_template257 ON region_template (template_ID );
CREATE TABLE page (
	alias VARCHAR ( 255 ) NOT NULL,
	title VARCHAR ( 255 ) NOT NULL,
	is_homepage SMALLINT NOT NULL,
	is_autentication_required SMALLINT NOT NULL,
	page_ID INTEGER NOT NULL,
	application_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_page92 PRIMARY KEY (page_ID)
	);
CREATE INDEX TC_page354 ON page (template_ID );
CREATE INDEX TC_page355 ON page (application_ID );
CREATE TABLE navigation_region (
	repeat_last_level SMALLINT NOT NULL,
	navigation_type_ID INTEGER NOT NULL,
	region_ID INTEGER NOT NULL,
	navigation_ID INTEGER NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_navigation_region111 PRIMARY KEY (region_ID)
	);
CREATE INDEX TC_navigation_region372 ON navigation_region (template_ID );
CREATE INDEX TC_navigation_region295 ON navigation_region (navigation_type_ID );
CREATE INDEX TC_navigation_region296 ON navigation_region (region_ID );
CREATE INDEX TC_navigation_region373 ON navigation_region (navigation_ID );
CREATE TABLE list_of_values (
	list_of_values_ID INTEGER NOT NULL,
	column_ID INTEGER NOT NULL,
	column_column_ID INTEGER NOT NULL,
	CONSTRAINT PK_list_of_values105 PRIMARY KEY (list_of_values_ID)
	);
CREATE INDEX TC_list_of_values376 ON list_of_values (column_ID );
CREATE INDEX TC_list_of_values377 ON list_of_values (column_column_ID );
CREATE TABLE data_type (
	data_type VARCHAR ( 255 ) NOT NULL,
	data_type_ID INTEGER NOT NULL,
	schema_ID INTEGER NOT NULL,
	CONSTRAINT PK_data_type118 PRIMARY KEY (data_type_ID)
	);
CREATE INDEX TC_data_type332 ON data_type (schema_ID );
CREATE TABLE report_template (
	report_begin VARCHAR ( 255 ) NOT NULL,
	report_end VARCHAR ( 255 ) NOT NULL,
	header_begin VARCHAR ( 255 ) NOT NULL,
	header_end VARCHAR ( 255 ) NOT NULL,
	header_cell VARCHAR ( 255 ) NOT NULL,
	row_begin VARCHAR ( 255 ) NOT NULL,
	row_end VARCHAR ( 255 ) NOT NULL,
	row_cell VARCHAR ( 255 ) NOT NULL,
	navigation_begin VARCHAR ( 255 ) NOT NULL,
	navigation_end VARCHAR ( 255 ) NOT NULL,
	previous_page VARCHAR ( 255 ) NOT NULL,
	next_page VARCHAR ( 255 ) NOT NULL,
	active_page VARCHAR ( 255 ) NOT NULL,
	inactive_page VARCHAR ( 255 ) NOT NULL,
	template_ID INTEGER NOT NULL,
	CONSTRAINT PK_report_template84 PRIMARY KEY (template_ID)
	);
CREATE INDEX TC_report_template249 ON report_template (template_ID );
ALTER TABLE url ADD CONSTRAINT FK_url131 FOREIGN KEY (navigation_item_ID) REFERENCES navigation_item (navigation_item_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE button_template ADD CONSTRAINT FK_button_template102 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_item ADD CONSTRAINT FK_page_item114 FOREIGN KEY (form_field_ID) REFERENCES form_field (form_field_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_item ADD CONSTRAINT FK_page_item122 FOREIGN KEY (region_ID) REFERENCES report_region (region_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_item ADD CONSTRAINT FK_page_item109 FOREIGN KEY (page_ID) REFERENCES page (page_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_template ADD CONSTRAINT FK_form_template97 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE drop_down_template ADD CONSTRAINT FK_drop_down_template100 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_template ADD CONSTRAINT FK_page_template107 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_template ADD CONSTRAINT FK_page_template96 FOREIGN KEY (page_type_ID) REFERENCES page_type (page_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE input_template ADD CONSTRAINT FK_input_template99 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE list_of_values ADD CONSTRAINT FK_list_of_values148 FOREIGN KEY (column_ID) REFERENCES view_column (column_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE list_of_values ADD CONSTRAINT FK_list_of_values149 FOREIGN KEY (column_column_ID) REFERENCES view_column (column_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_template ADD CONSTRAINT FK_report_template98 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE function ADD CONSTRAINT FK_function133 FOREIGN KEY (schema_ID) REFERENCES schema (schema_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE function ADD CONSTRAINT FK_function139 FOREIGN KEY (data_type_ID) REFERENCES data_type (data_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE fetch_row_condition ADD CONSTRAINT FK_fetch_row_condition147 FOREIGN KEY (column_ID) REFERENCES view_column (column_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE fetch_row_condition ADD CONSTRAINT FK_fetch_row_condition166 FOREIGN KEY (page_item_ID) REFERENCES page_item (page_item_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE fetch_row_condition ADD CONSTRAINT FK_fetch_row_condition119 FOREIGN KEY (form_pre_fill_ID) REFERENCES form_pre_fill (form_pre_fill_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE region_template ADD CONSTRAINT FK_region_template108 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE view ADD CONSTRAINT FK_view132 FOREIGN KEY (schema_ID) REFERENCES schema (schema_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE data_type ADD CONSTRAINT FK_data_type134 FOREIGN KEY (schema_ID) REFERENCES schema (schema_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_region ADD CONSTRAINT FK_report_region124 FOREIGN KEY (region_ID) REFERENCES region (region_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_region ADD CONSTRAINT FK_report_region142 FOREIGN KEY (view_ID) REFERENCES view (view_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_region ADD CONSTRAINT FK_report_region155 FOREIGN KEY (template_ID) REFERENCES report_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_item ADD CONSTRAINT FK_navigation_item165 FOREIGN KEY (page_ID) REFERENCES page (page_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_item ADD CONSTRAINT FK_navigation_item130 FOREIGN KEY (navigation_item_navigation_item_ID) REFERENCES navigation_item (navigation_item_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_item ADD CONSTRAINT FK_navigation_item129 FOREIGN KEY (navigation_ID) REFERENCES navigation (navigation_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field158 FOREIGN KEY (textarea_template_template_ID) REFERENCES textarea_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field146 FOREIGN KEY (column_ID) REFERENCES view_column (column_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field117 FOREIGN KEY (list_of_values_ID) REFERENCES list_of_values (list_of_values_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field157 FOREIGN KEY (drop_down_template_template_ID) REFERENCES drop_down_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field138 FOREIGN KEY (parameter_ID) REFERENCES parameter (parameter_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field115 FOREIGN KEY (field_type_ID) REFERENCES field_type (field_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field125 FOREIGN KEY (form_pre_fill_ID) REFERENCES form_region (form_pre_fill_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_field ADD CONSTRAINT FK_form_field156 FOREIGN KEY (template_ID) REFERENCES input_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE application ADD CONSTRAINT FK_application91 FOREIGN KEY (authentication_scheme_ID) REFERENCES authentication_scheme (authentication_scheme_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE application ADD CONSTRAINT FK_application105 FOREIGN KEY (template_ID) REFERENCES page_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE application ADD CONSTRAINT FK_application150 FOREIGN KEY (database_ID) REFERENCES database (database_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE application ADD CONSTRAINT FK_application135 FOREIGN KEY (function_ID) REFERENCES function (function_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_item_template ADD CONSTRAINT FK_navigation_item_template103 FOREIGN KEY (template_ID) REFERENCES navigation_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE view_column ADD CONSTRAINT FK_column144 FOREIGN KEY (view_ID) REFERENCES view (view_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE view_column ADD CONSTRAINT FK_column141 FOREIGN KEY (data_type_ID) REFERENCES data_type (data_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE parameter ADD CONSTRAINT FK_parameter137 FOREIGN KEY (function_ID) REFERENCES function (function_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE parameter ADD CONSTRAINT FK_parameter140 FOREIGN KEY (data_type_ID) REFERENCES data_type (data_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE session ADD CONSTRAINT FK_session90 FOREIGN KEY (application_ID) REFERENCES application (application_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation ADD CONSTRAINT FK_navigation153 FOREIGN KEY (application_ID) REFERENCES application (application_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_column ADD CONSTRAINT FK_report_column116 FOREIGN KEY (report_column_type_ID) REFERENCES report_column_type (report_column_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_column ADD CONSTRAINT FK_report_column145 FOREIGN KEY (column_ID) REFERENCES view_column (column_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_column ADD CONSTRAINT FK_report_column123 FOREIGN KEY (region_ID) REFERENCES report_region (region_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_template_display_point ADD CONSTRAINT FK_page_template_display_po95 FOREIGN KEY (display_point_ID) REFERENCES display_point (display_point_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page_template_display_point ADD CONSTRAINT FK_page_template_display_po106 FOREIGN KEY (template_ID) REFERENCES page_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page ADD CONSTRAINT FK_page161 FOREIGN KEY (template_ID) REFERENCES page_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE page ADD CONSTRAINT FK_page152 FOREIGN KEY (application_ID) REFERENCES application (application_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE textarea_template ADD CONSTRAINT FK_textarea_template101 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE html_region ADD CONSTRAINT FK_html_region121 FOREIGN KEY (region_ID) REFERENCES region (region_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_pre_fill ADD CONSTRAINT FK_form_pre_fill143 FOREIGN KEY (view_ID) REFERENCES view (view_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE region ADD CONSTRAINT FK_region163 FOREIGN KEY (page_template_display_point_ID) REFERENCES page_template_display_point (page_template_display_point_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE region ADD CONSTRAINT FK_region162 FOREIGN KEY (template_ID) REFERENCES region_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE region ADD CONSTRAINT FK_region164 FOREIGN KEY (page_ID) REFERENCES page (page_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_region ADD CONSTRAINT FK_form_region118 FOREIGN KEY (form_pre_fill_ID) REFERENCES form_pre_fill (form_pre_fill_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_region ADD CONSTRAINT FK_form_region126 FOREIGN KEY (region_ID) REFERENCES region (region_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_region ADD CONSTRAINT FK_form_region154 FOREIGN KEY (template_ID) REFERENCES form_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_region ADD CONSTRAINT FK_form_region159 FOREIGN KEY (button_template_template_ID) REFERENCES button_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE form_region ADD CONSTRAINT FK_form_region136 FOREIGN KEY (function_ID) REFERENCES function (function_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_region ADD CONSTRAINT FK_navigation_region160 FOREIGN KEY (template_ID) REFERENCES navigation_template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_region ADD CONSTRAINT FK_navigation_region120 FOREIGN KEY (navigation_type_ID) REFERENCES navigation_type (navigation_type_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_region ADD CONSTRAINT FK_navigation_region128 FOREIGN KEY (navigation_ID) REFERENCES navigation (navigation_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_region ADD CONSTRAINT FK_navigation_region127 FOREIGN KEY (region_ID) REFERENCES region (region_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE schema ADD CONSTRAINT FK_schema151 FOREIGN KEY (database_ID) REFERENCES database (database_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE navigation_template ADD CONSTRAINT FK_navigation_template104 FOREIGN KEY (template_ID) REFERENCES template (template_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE report_column_link ADD CONSTRAINT FK_report_column_link113 FOREIGN KEY (report_column_ID) REFERENCES report_column (report_column_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION;
