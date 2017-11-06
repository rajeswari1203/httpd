directory '/root/asdasd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :delete
end

serv = "httpd"


package serv  do 
 action :install
end

service serv do
 action [:enable, :start]
end

file '/var/www/html/index1.html' do
  content 'hello dubai......:)'
  action :create
end

service 'iptables' do
  action :stop
  notifies :start, 'service[httpd]', :immediately
end



include_recipe 'httpd::createfile'
