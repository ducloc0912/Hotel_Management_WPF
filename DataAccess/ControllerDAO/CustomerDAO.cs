using BusinessObject.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.ControllerDAO
{
    public class CustomerDAO
    {
        private static CustomerDAO instance = null;
        public static readonly object instanceLock = new object();
        private CustomerDAO() { }
        public static CustomerDAO Instance
        {
            get
            {
                lock (instanceLock)
                {
                    if (instance == null)
                    {
                        instance = new CustomerDAO();
                    }
                    return instance;
                }
            }
        }

        public Customer GetCustomerByLogin(string email, string pass)
        {
            Customer customer = null;
            try
            {
                using (var context = new PRN212_ProjectContext())
                {
                    customer = context.Customers.SingleOrDefault(i => i.EmailAddress.Equals(email) && i.Password.Equals(pass));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return customer;
        }

        public IEnumerable<Customer> GetCustomers() { 
            List<Customer> customers;
            try
            {
                using (var context = new PRN212_ProjectContext())
                {
                    customers = context.Customers.ToList();
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return customers;
        }

        public Customer GetCustomerByID(int id)
        {
            Customer customer = null;
            try
            {
                var context = new PRN212_ProjectContext();
                customer = context.Customers.FirstOrDefault(item => item.CustomerId == id);
                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return customer;
        }

        public void AddNew(Customer customer)
        {
            try
            {
                using (var context = new PRN212_ProjectContext())
                {
                    bool phoneExists = context.Customers.Any(x => x.Telephone == customer.Telephone);
                    if (phoneExists)
                    {
                        throw new Exception("sdt đã tồn tại trong cơ sở dữ liệu.");
                    }
                    bool emailExists = context.Customers.Any(c => c.EmailAddress == customer.EmailAddress);
                    if (emailExists)
                    {
                        throw new Exception("Email đã tồn tại trong cơ sở dữ liệu.");
                    }

                    Customer currentCustomer = GetCustomerByID(customer.CustomerId);
                    if (currentCustomer == null)
                    {
                        context.Customers.Add(customer);
                        context.SaveChanges();
                    }
                    else
                    {
                        throw new Exception("Khách hàng đã tồn tại.");
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Update(Customer customer)
        {
            try
            {
                Customer currentCustomer = GetCustomerByID(customer.CustomerId);
                if (currentCustomer != null)
                {
                    using (var context = new PRN212_ProjectContext())
                    {
                        // Kiểm tra xem có khách hàng nào khác đã dùng email này chưa
                        bool isEmailDuplicate = context.Customers
                            .Any(c => c.EmailAddress == customer.EmailAddress && c.CustomerId != customer.CustomerId);

                        if (isEmailDuplicate)
                        {
                            throw new Exception("The email is already in use by another customer.");
                        }

                        context.Entry(customer).State = EntityState.Modified;
                        context.SaveChanges();
                    }
                }
                else
                {
                    throw new Exception("The customer does not already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public void Remove(Customer Customer)
        {
            try
            {
                Customer currentCustomer = GetCustomerByID(Customer.CustomerId);
                if (currentCustomer != null)
                {
                    var context = new PRN212_ProjectContext();
                        context.Customers.Remove(Customer);
                        context.SaveChanges();
                }
                else
                {
                    throw new Exception("The Customer does not already exist.");
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


    }
}
