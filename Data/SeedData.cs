using Microsoft.EntityFrameworkCore;

namespace contatinapi.Data
{
    public class SeedData
    {
        DbContext _context;
        public SeedData(DbContext context){
            _context=context;
        }
        public void SeedUsers(){
        }
    }
}