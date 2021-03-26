using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class Member : Person
    {
        public bool IsActive { get; set; }
        public string UserName { get; set; }

        private string password;

        public string Password
        {
            get 
            { 
                return this.password; 
            }
            set 
            { 
                this.password = value; 
            }
        }

        public byte[] ProfilePicture { get; set; }

        public int RoleId { get; set; }

        public Address address { get; set; }

        public List<Phone> phones { get; set; }



        public override async Task addPerson()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.Person member = new MovieStore.Data.Person();

                member.FIRST_NAME = this.FirstName;
                member.MIDDLE_NAME = this.MiddleName;
                member.LAST_NAME = this.LastName;
                member.IS_ACTIVE = this.IsActive;
                member.USERNAME = this.UserName;
                member.PASSWORD = this.Password;
                member.PROFILE_PICTURE = this.ProfilePicture;
                member.ROLE_ID = this.RoleId;
                member.DATE_CREATED = DateTime.Now;

                member.Addresses.Add(new MovieStore.Data.Address 
                { 
                    ADDRESS_LINE_1 = this.address.AddressLine1,
                    ADDRESS_LINE_2 = this.address.AddressLine2,
                    CITY = this.address.City,
                    ZIP_CODE = this.address.ZipCode,
                    STATE = this.address.State,
                    IS_PRIMARY = this.address.IsPrimary,
                    DATE_CREATED = DateTime.Now
                    
                
                });

                if (this.phones != null && this.phones.Count > 0)
                {
                    foreach (var item in this.phones)
                    {
                        member.Phones.Add(new MovieStore.Data.Phone
                        {
                            NUMBER = item.PhoneNumber,
                            PHONE_TYPE_ID = item.PhoneTypeId,
                            DATE_CREATED = DateTime.Now

                        });
                    }
                }


                db.People.Add(member);
                await db.SaveChangesAsync();


            }
        }

        public override async Task updatePerson()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var member = await db.People.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (member != null)
                {
                    member.FIRST_NAME = this.FirstName;
                    member.MIDDLE_NAME = this.MiddleName;
                    member.LAST_NAME = this.LastName;
                    member.PROFILE_PICTURE = this.ProfilePicture;
                    member.DATE_UPDATED = DateTime.Now;
                }
            }
        }

        public async Task updateSecurityInfo()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var member = await db.People.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (member != null)
                {
                    member.USERNAME = this.UserName;
                    member.PASSWORD = this.Password;
                    member.DATE_UPDATED = DateTime.Now;
                }
            }
        }

        public async Task updatePhoneInfo()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                using (var transaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        var phones = await db.Phones.Where(w => w.PERSON_ID == this.Id).ToListAsync();

                        if (phones != null)
                        {
                            db.Phones.RemoveRange(phones);
                            await db.SaveChangesAsync();
                        }

                        if (this.phones != null && this.phones.Count > 0)
                        {
                            foreach(Phone item in this.phones)
                            {
                                MovieStore.Data.Phone phone = new MovieStore.Data.Phone();

                                phone.NUMBER = item.PhoneNumber;
                                phone.PHONE_TYPE_ID = item.PhoneTypeId;
                                phone.PERSON_ID = this.Id;

                                db.Phones.Add(phone);
                                await db.SaveChangesAsync();
                            }
                        }

                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        throw ex;
                    }
                }
            }


        }
    }
}
