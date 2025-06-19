class CompanyInfo {
  static String companyInfo = """
At Alvi Automobiles, we are redefining the future of automotive excellence with our flagship brand, AlviAutomobiles. Founded in 2020 by our visionary entrepreneur, Salman Alvi, a passionate car enthusiast based in New York City, AlviAutomobiles embodies our commitment to blending iconic design with cutting-edge technology.

Our focus is clear: crafting modern interpretations of legendary vehicles like the GT40 and Cobra, while simultaneously developing unique and original designs of our own. As a forward-thinking, technology-driven company, we combine vintage race car aesthetics with state-of-the-art engineering to produce vehicles that are not only faithful to their heritage but also enhanced for daily drivability and performance.

While we currently focus on building premium-quality component cars, we are actively developing and preparing for the production of low-volume exotic vehicles that will set new standards in automotive design and innovation. Every AlviAutomobiles is meticulously crafted at our advanced facility in South Carolina by a team of dedicated automotive experts, innovative designers, and skilled fabricators.

At Alvi Automobiles, we're not just building cars; we're crafting the next generation of automotive excellence and getting ready to introduce groundbreaking exotic models for the discerning enthusiast.
""";

  static List<Leader> leaders = [
    Leader(
      name: "Salman Alvi",
      role: "Founder, President and CEO",
      email: "sal@alviautomobiles.com",
      phone: "+1 (718) 787-5849",
    ),
    Leader(
      name: "Jeremy Diehl",
      role: "Build & Technical Support",
      email: "jeremy@alviautomobiles.com",
      phone: "+1 (843) 560-4512",
    ),
    Leader(name: "Danny T", role: "Director Sales", email: "", phone: ""),
    Leader(
      name: "Anam S",
      role: "Marketing & Social Media Manager",
      email: "",
      phone: "",
    ),
  ];
}

class Leader {
  final String name;
  final String role;
  final String email;
  final String phone;

  Leader({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
  });
}
