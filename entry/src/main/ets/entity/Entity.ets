export class Attraction {
  public aid: number
  public name: string
  public location: string
  public description: string
  public openingHours: string
  public image: string
  public price: number

  constructor(aId: number, name: string, location: string, description: string, openingHours: string, image: string, price: number) {
    this.aid = aId;
    this.name = name;
    this.location = location;
    this.description = description;
    this.openingHours = openingHours;
    this.image = image;
    this.price = price;
  }

  // 添加toString方法
  toString(): string {
    return `Attraction { aId: ${this.aid}, name: ${this.name}, location: ${this.location}, description: ${this.description}, openingHours: ${this.openingHours},  image: ${this.image}, price: ${this.price} }`;
  }
}

export class Operation {
  public oid: number
  public aid: number
  public name: string
  public description: string
  public openingHours: string
  public image: string
  public price: number

  constructor(oid: number, aid: number, name: string, description: string, openingHours: string, image: string, price: number) {
    this.oid = oid;
    this.aid = aid;
    this.name = name;
    this.description = description;
    this.openingHours = openingHours;
    this.image = image;
    this.price = price;
  }

  public toString(): string {
    return `Operation Details:
    oId: ${this.oid}
    aId: ${this.aid}
    Name: ${this.name}
    Description: ${this.description}
    Opening Hours: ${this.openingHours}
    Image: ${this.image}
    Price: ${this.price}`;
  }
}


export class User {
  public uid: number
  public uname: string
  public upassword: string
  public avatar: string
  public phone: string

  constructor(uid: number, uname: string, upassword: string, avatar: string, phone: string,) {
    this.uid = uid;
    this.uname = uname;
    this.upassword = upassword;
    this.avatar = avatar;
    this.phone = phone;
  }
}


export class Reservation {
  public aid: string;
  public rid: string;
  public uid: string;
  public aname: string;
  public reservationTime: string;
  public card: string;

  constructor(aid: string, rid: string, uid: string, aname: string, reservationTime: string, card: string) {
    this.aid = aid;
    this.rid = rid;
    this.uid = uid;
    this.aname = aname;
    this.reservationTime = reservationTime;
    this.card = card;
  }

  public toString(): string {
    return `Reservation {
      aid: ${this.aid},
      rid: ${this.rid},
      uid: ${this.uid},
      aname: ${this.aname},
      reservationTime: ${this.reservationTime},
      card: ${this.card}
    }`;
  }
}
