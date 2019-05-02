1. Tải solr và cài đặt (bản t tải là 8.0.0) (xem hướng dẫn trên mạng)
2. Chạy solr:
- Vào thư mục solr 8.0.0, mở terminal:
	bin/solr start
Xem GUI: vào link http://localhost:8983/solr/
3. Thêm core vnexpress:
	bin/solr create -c  vnexpress
4. Thêm dữ liệu vào core:
- Tải file vnexpress.json về, lưu vào solr8.0.0/example/exampledocs/vnexpress.json (lưu đâu cũng được nhưng phải chỉ ra được đường dẫn tới file)
bin/post -c vnexpress example/exampledocs/vnexpress.json
5. Cấu hình:
- Vào solr 8.0.0/server/solr/vnexpress/conf/manage-schema, tìm đoạn dưới và thêm thuộc tính multiValued = true ở các dòng màu vàng
<field name="_nest_path_" type="_nest_path_"/>
  <field name="_root_" type="string" docValues="false" indexed="true" stored="false"/>
  <field name="_text_" type="text_general" multiValued="true" indexed="true" stored="false"/>
  <field name="_version_" type="plong" indexed="false" stored="false"/>
  <field name="body" type="text_general" multiValued="true"/>
  <field name="category" type="text_general" multiValued="true"/>
  <field name="id" type="string" multiValued="false" indexed="true" required="true" stored="true"/>
  <field name="tags" type="text_general" multiValued="true"/>
  <field name="time_post" type="text_general" multiValued="false"/>
  <field name="title" type="text_general" multiValued="false"/>
  <field name="url" type="text_general" multiValued="false"/>
- Thêm vào cuối file các dòng sau:
<field name="combinedSearch" type="text_general" indexed="true" stored="false" multiValued="true"/>
  <copyField source="category" dest="combinedSearch"/>
  <copyField source="body" dest="combinedSearch"/>
  <copyField source="title" dest="combinedSearch"/>
