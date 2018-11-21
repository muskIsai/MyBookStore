using System;
using System.Collections.Generic;
using System.Linq;
//using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Data.Entity;
using System.Data.SqlClient;


namespace BookStore1.Models
{

    public class BookContext : DbContext //Criar BD ficticia
    {
        
        public DbSet<Book> Books { get; set; }
        public DbSet<Purchase> Purchases { get; set; }
    }

    //Inicializacao da BD com "BookDbInitializer"
    /*A classe "DropCreateDatabaseAlways" permite recarregar o BD com alguns dados iniciais toda vez que você iniciar um novo. 
    * Como tais valores iniciais, 3 objetos Book são criados aqui. Usando o método "db.Books.Add", adicionamos cada um desses objetos ao BD */
    
    public class BookDbInitializer: DropCreateDatabaseAlways<BookContext>
    {
        protected override void Seed(BookContext db)
        {
            db.Books.Add(new Book { Name = "Войно и мир", Author = "Лю Толстой", Price = 230 });
            db.Books.Add(new Book { Name = "Оцы и дети", Author = "И. Тургоновый", Price = 110 });
            db.Books.Add(new Book { Name = "Чайка", Author = "А. Чехов", Price = 95 });

            base.Seed(db);
        }
    }
}